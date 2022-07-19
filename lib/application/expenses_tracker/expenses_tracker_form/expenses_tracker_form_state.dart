part of 'expenses_tracker_form_bloc.dart';

@freezed
class ExpensesTrackerFormState with _$ExpensesTrackerFormState {
  const factory ExpensesTrackerFormState({
    required String trackerName,
    required String expenseName,
    required double expenseAmount,
    required List<String> addedPeople,
    required String payerId,
  }) = _ExpensesTrackerFormState;

  factory ExpensesTrackerFormState.initial() => ExpensesTrackerFormState(
        trackerName: '',
        expenseName: '',
        expenseAmount: 0,
        addedPeople: List.empty(growable: true),
        payerId: '',
      );
}
