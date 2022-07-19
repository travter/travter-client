import 'package:freezed_annotation/freezed_annotation.dart';

import '../friend/friend.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  const factory User( // @JsonKey(name: 'friends') List<Friend> friends,
      {
    required String uid,
    required String username,
    required String bio,
    required String profilePicture, // reference to storage?
    required String firstName,
    required String lastName,
    required List<String> followers,
    required List<String> following,
    required List<String> posts,
    required List<String> expensesTrackers,
    required List<String> likedPostsIds,
    required List<String> friends,
  }) = _User;

  factory User.empty() => const User(
        uid: '',
        username: '',
        bio: '',
        profilePicture: '',
        firstName: '',
        lastName: '',
        followers: [],
        following: [],
        posts: [],
        expensesTrackers: [],
        likedPostsIds: [],
        friends: [],
      );

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
