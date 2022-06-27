part of 'expenses_tracker_form_bloc.dart';


@freezed
class ExpensesTrackerFormEvent with _$ExpensesTrackerFormEvent {
  const factory ExpensesTrackerFormEvent.trackerNameChanged(String name) = TrackerNameChanged;
  const factory ExpensesTrackerFormEvent.expenseNameChanged(String name) = ExpenseNameChanged;
  const factory ExpensesTrackerFormEvent.expenseAmountChanged(double amount) = AmountChanged;
  const factory ExpensesTrackerFormEvent.addPeopleStarted() = AddPeopleStarted;
  const factory ExpensesTrackerFormEvent.submitFormPressed() = SubmitFormPressed;
}