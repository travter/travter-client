import 'package:freezed_annotation/freezed_annotation.dart';

import 'expense.dart';

part 'expenses_tracker.freezed.dart';
part 'expenses_tracker.g.dart';

@freezed
abstract class ExpensesTracker implements _$ExpensesTracker {
  const factory ExpensesTracker({
    required String name,
    required String currency,
    required DateTime createdAt,
    required String ownerId,
    required List<Expense> expenses,
    required List<String> authorizedUsers,
  }) = _ExpensesTracker;

  factory ExpensesTracker.empty() => ExpensesTracker(
        name: '',
        currency: '',
        ownerId: '',
        createdAt: DateTime.now(),
        expenses: List.empty(growable: true),
        authorizedUsers: List.empty(growable: true),
      );

  factory ExpensesTracker.fromJson(Map<String, Object?> json) =>
      _$ExpensesTrackerFromJson(json);
}
