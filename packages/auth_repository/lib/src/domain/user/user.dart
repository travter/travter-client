import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
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
    required List<String> authorizedExpenseTrackers,
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
        authorizedExpenseTrackers: [],
        followers: [],
        following: [],
        posts: [],
        expensesTrackers: [],
        likedPostsIds: [],
        friends: [],
      );

  factory User.fromEdited(User user, String username, String bio,
          String firstName, String lastName) =>
      User(
        authorizedExpenseTrackers: user.authorizedExpenseTrackers,
        username: username,
        bio: bio,
        firstName: firstName,
        lastName: lastName,
        friends: user.friends,
        profilePicture: user.profilePicture,
        posts: user.posts,
        followers: user.followers,
        expensesTrackers: user.expensesTrackers,
        uid: user.uid,
        likedPostsIds: user.likedPostsIds,
        following: user.following,
      );

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
