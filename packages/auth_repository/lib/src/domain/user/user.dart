import 'package:freezed_annotation/freezed_annotation.dart';

import '../friend/friend.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  const factory User(
    @JsonKey(name:'friends') List<Friend> friends, {
    required String uid,
    required String username,
    required String bio,
    required String profilePicture, // reference to storage?
    required List<String> followers,
    required List<String> following,
    required List<String> posts,
    required List<String> expensesTrackers,
  }) = _User;

  factory User.empty() => User(
        const [],
        uid: '',
        username: '',
        bio: '',
        profilePicture: '',
        // wtf is that empty list? refactor needed someday
        followers: List.empty(growable: true),
        following: List.empty(growable: true),
        posts: List.empty(growable: true),
        expensesTrackers: List.empty(growable: true),
      );

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
