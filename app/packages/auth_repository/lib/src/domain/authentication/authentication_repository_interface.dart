import 'package:dartz/dartz.dart';

import '../core/typedefs.dart';
import '../user/user.dart';
import 'value_objects.dart';

abstract class AuthenticationRepositoryInterface {
  Future<AuthResult> loginWithGoogle();

  Future<AuthResult> loginWithFacebook();

  Future<void> signOut();

  Future<Option<User>> getSignedInUser();

  Future<AuthResult> signInWithEmail({
    required EmailAddress email,
    required Password password,
  });

  Future<AuthResult> loginWithEmail({
    required EmailAddress email,
    required Password password,
  });
}
