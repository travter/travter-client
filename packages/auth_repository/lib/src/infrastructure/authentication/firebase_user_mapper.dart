import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../../domain/core/value_objects.dart';
import '../../domain/user/user.dart';
import '../../domain/user/value_objects.dart';

extension FirebaseUserDomainX on firebase.User {
  User toDomain(String id) {
    return User(
      uid: id, username: Username(''),
    );
  }
}
