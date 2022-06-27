// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_tracker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExpensesTracker _$$_ExpensesTrackerFromJson(Map<String, dynamic> json) =>
    _$_ExpensesTracker(
      name: json['name'] as String,
      description: json['description'] as String,
      currency: json['currency'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      ownerId: json['ownerId'] as String,
      authorizedUsers: (json['authorizedUsers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ExpensesTrackerToJson(_$_ExpensesTracker instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'currency': instance.currency,
      'createdAt': instance.createdAt.toIso8601String(),
      'ownerId': instance.ownerId,
      'authorizedUsers': instance.authorizedUsers,
    };
