import 'package:freezed_annotation/freezed_annotation.dart';

import 'expense.dart';

part 'expenses_tracker.freezed.dart';

part 'expenses_tracker.g.dart';

@freezed
class ExpensesTracker with _$ExpensesTracker {
  @JsonSerializable(explicitToJson: true)
  const factory ExpensesTracker(
    @JsonKey(name: 'expenses') List<Expense> expenses, {
    required double totalExpenses,
    required String name,
    required String currency,
    required DateTime createdAt,
    required String ownerId,
    required List<String> authorizedUsers,
    required String id,
  }) = _ExpensesTracker;

  factory ExpensesTracker.empty() => ExpensesTracker(
        List.empty(growable: true),
        name: '',
        currency: '',
        ownerId: '',
        createdAt: DateTime.now(),
        authorizedUsers: List.empty(growable: true),
        id: '',
        totalExpenses: 0,
      );

  factory ExpensesTracker.fromJson(Map<String, Object?> json) =>
      _$ExpensesTrackerFromJson(json);
}
