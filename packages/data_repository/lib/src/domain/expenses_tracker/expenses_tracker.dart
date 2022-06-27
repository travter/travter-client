import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenses_tracker.freezed.dart';
part 'expenses_tracker.g.dart';

@freezed
abstract class ExpensesTracker implements _$ExpensesTracker {
  const factory ExpensesTracker({
    required String name,
    required String description,
    required String currency,
    required DateTime createdAt,
    required String ownerId,
    required List<String> authorizedUsers,
  }) = _ExpensesTracker;

  factory ExpensesTracker.empty() => ExpensesTracker(
        name: '',
        description: '',
        currency: '',
        ownerId: '',
        createdAt: DateTime.now(),
        authorizedUsers: List.empty(growable: true),
      );

  factory ExpensesTracker.fromJson(Map<String, Object?> json) =>
      _$ExpensesTrackerFromJson(json);
}
