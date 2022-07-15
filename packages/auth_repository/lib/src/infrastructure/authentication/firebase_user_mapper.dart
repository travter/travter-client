import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../../domain/user/user.dart';

extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return User(
      const [],
      uid: uid,
      username: '',
      bio: '',
      profilePicture: '',
      followers: List.empty(growable: true),
      following: List.empty(growable: true),
      posts: List.empty(growable: true),
      expensesTrackers: List.empty(growable: true),
    );
  }
}
