import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../../domain/core/value_objects.dart';
import '../../domain/user/user.dart';
import '../../domain/user/value_objects.dart';

extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return User(
      uid: '', username: Username(''),
    );
  }
}
