import 'package:freezed_annotation/freezed_annotation.dart';

import 'value_objects.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String uid,
    required String username,
    required String bio,
    required List<String> followers,
    required List<String> following,
    required List<String> posts,
    required List<String> expensesTrackers,
    required List<String> friends,
  }) = _User;

  factory User.empty() => User(
    uid: '',
    username: '',
    bio: '',
    followers: List.empty(growable: true),
    following: List.empty(growable: true),
    posts: List.empty(growable: true),
    expensesTrackers: List.empty(growable: true),
    friends: List.empty(growable: true),
  );

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
