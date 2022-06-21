import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../domain/authentication/auth_failure.dart';
import '../../domain/authentication/authentication_facade_interface.dart';
import '../../domain/user/user.dart';
import '../../domain/authentication/value_objects.dart';
import '../../domain/core/typedefs.dart';
import 'firebase_user_mapper.dart';

@LazySingleton(as: AuthenticationFacadeInterface)
class AuthenticationFacade implements AuthenticationFacadeInterface {
  AuthenticationFacade(
    this._firebaseAuth,
    this._googleSignIn,
    this._facebookAuth,
  );

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
    await _firebaseAuth.signInWithCredential(facebookAuthCredential);

    return right(unit);
  }

  @override
  Future<AuthResult> loginWithEmail({
    required EmailAddress email,
    required Password password,
  }) async {
    final emailStr = email.getOrCrash();
    final passwordStr = password.getOrCrash();

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

    await _firebaseAuth.createUserWithEmailAndPassword(
      email: emailStr,
      password: passwordStr,
    );

    return right(unit);
  }
}
