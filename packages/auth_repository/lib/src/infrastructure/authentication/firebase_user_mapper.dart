import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../../domain/user/user.dart';

extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return User(
      uid: uid,
      username: '',
      bio: '',
      profilePicture: '',
      firstName: '',
      lastName: '',
      followers: const [],
      following: const [],
      posts: const [],
      expensesTrackers: const [],
      likedPostsIds: const [],
      friends: const [],
    );
  }
}
