import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

@freezed
class Expense with _$Expense {
  const factory Expense({
    required String name,
    required double moneyAmount,
    required String payerId,
    required String id,
  }) = _Expense;

  factory Expense.empty() => const Expense(
        name: '',
        moneyAmount: 0,
        payerId: '',
        id: '',
      );

  factory Expense.fromJson(Map<String, Object?> json) =>
      _$ExpenseFromJson(json);
}
