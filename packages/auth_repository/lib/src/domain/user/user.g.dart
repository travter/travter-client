// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      (json['friends'] as List<dynamic>)
          .map((e) => Friend.fromJson(e as Map<String, dynamic>))
          .toList(),
      uid: json['uid'] as String,
      username: json['username'] as String,
      bio: json['bio'] as String,
      profilePicture: json['profilePicture'] as String,
      followers:
          (json['followers'] as List<dynamic>).map((e) => e as String).toList(),
      following:
          (json['following'] as List<dynamic>).map((e) => e as String).toList(),
      posts: (json['posts'] as List<dynamic>).map((e) => e as String).toList(),
      expensesTrackers: (json['expensesTrackers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'friends': instance.friends.map((e) => e.toJson()).toList(),
      'uid': instance.uid,
      'username': instance.username,
      'bio': instance.bio,
      'profilePicture': instance.profilePicture,
      'followers': instance.followers,
      'following': instance.following,
      'posts': instance.posts,
      'expensesTrackers': instance.expensesTrackers,
    };
