import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend.freezed.dart';
part 'friend.g.dart';

@freezed
class Friend with _$Friend {
  const factory Friend({
    required String username, // gotta be unique
    required String profilePicture,
  }) = _Friend;

  factory Friend.empty() => const Friend(
        username: '',
        profilePicture: '',
      );

  factory Friend.fromJson(Map<String, Object?> json) => _$FriendFromJson(json);
}
