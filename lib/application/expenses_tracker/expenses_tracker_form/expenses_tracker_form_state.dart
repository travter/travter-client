part of 'expenses_tracker_form_bloc.dart';

@freezed
class ExpensesTrackerFormState with _$ExpensesTrackerFormState {
  const factory ExpensesTrackerFormState({
    required String trackerName,
    required String expenseName,
    required double expenseAmount,
    required AddPeopleStatus addPeopleStatus,
    required List<String> selectedUsers,
    required String payerId,
  }) = _ExpensesTrackerFormState;

  factory ExpensesTrackerFormState.initial() => const ExpensesTrackerFormState(
        trackerName: '',
        expenseName: '',
        expenseAmount: 0,
        addPeopleStatus: AddPeopleStatus.initial,
        selectedUsers: [],
        payerId: '',
      );
}
