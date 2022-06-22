import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/authentication/auth_failure.dart';
import '../../domain/authentication/authentication_repository_interface.dart';
import '../../domain/authentication/value_objects.dart';
import '../../domain/core/typedefs.dart';
import '../../domain/core/value_validators.dart';
import '../../domain/user/user.dart';
import 'firebase_user_mapper.dart';

class AuthenticationRepository implements AuthenticationRepositoryInterface {
  AuthenticationRepository({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    FacebookAuth? facebookAuth,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _facebookAuth = facebookAuth ?? FacebookAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<Option<User>> getSignedInUser() async {
    return optionOf(_firebaseAuth.currentUser?.toDomain());
  }

  @override
  Future<AuthResult> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);

      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<AuthResult> loginWithFacebook() async {
    final loginResult = await _facebookAuth.login();

    final facebookAuthCredential = FacebookAuthProvider.credential(
      loginResult.accessToken!.token,
    );
    try {
      await _firebaseAuth.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (err) {
      debugPrint(err.toString());
      return left(const AuthFailure.serverError());
    }

    return right(unit);
  }

  @override
  Future<AuthResult> loginWithEmail({
    required EmailAddress email,
    required Password password,
  }) async {
    final emailStr = email.getOrCrash();
    final passwordStr = password.getOrCrash();

    print('WITAM');

    await _firebaseAuth.signInWithEmailAndPassword(
      email: emailStr,
      password: passwordStr,
    );

    return right(unit);
  }

  @override
  Future<AuthResult> signInWithEmail({
    required EmailAddress email,
    required Password password,
  }) async {
    final emailStr = email.getOrCrash();
    final passwordStr = password.getOrCrash();

    final isPasswordValid = validatePassword(passwordStr);
    final isEmailValid = validateEmailAddress(emailStr);

    var isInvalid = false;
    isPasswordValid.fold((l) => isInvalid = true, (r) => null);
    isEmailValid.fold((l) => isInvalid = true, (r) => null);

    if (isInvalid) {
      return left(const AuthFailure.invalidEmailOrPassword());
    }

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailStr,
        password: passwordStr,
      );
    } on FirebaseAuthException catch (err) {
      if (err.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      }
    }

    return right(unit);
  }
}
