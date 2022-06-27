import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenses_tracker.freezed.dart';

@freezed
abstract class ExpensesTracker implements _$ExpensesTracker {
  const factory ExpensesTracker({
    required String name,
    required String description,
    required String currency,
    required DateTime createdAt,

  }) = _ExpensesTracker;

  factory ExpensesTracker.empty() => ExpensesTracker(
        name: '',
        description: '',
        currency: '',
        createdAt: DateTime.now(),
      );
}
