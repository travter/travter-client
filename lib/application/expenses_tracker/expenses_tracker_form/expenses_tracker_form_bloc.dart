import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'expenses_tracker_form_bloc.freezed.dart';

part 'expenses_tracker_form_event.dart';

part 'expenses_tracker_form_state.dart';

class ExpensesTrackerFormBloc
    extends Bloc<ExpensesTrackerFormEvent, ExpensesTrackerFormState> {
  ExpensesTrackerFormBloc(this._dataRepository, this._authRepository)
      : super(ExpensesTrackerFormState.initial()) {
    on<TrackerNameChanged>((event, emit) {
      emit(state.copyWith(trackerName: event.name));
    });

    on<ExpenseNameChanged>((event, emit) {
      emit(state.copyWith(expenseName: event.name));
    });

    on<ExpenseAmountChanged>((event, emit) {
      emit(state.copyWith(expenseAmount: event.amount));
    });

    on<SubmitFormPressed>((event, emit) async {
      final currentUser = await _authRepository.getSignedInUser();

      const uuid = Uuid();

      // implement failure on fold
      await currentUser.fold(() => null, (user) async {
        final expense = Expense(
            name: state.expenseName,
            moneyAmount: state.expenseAmount,
            payerId: user.uid,
            id: uuid.v1());

        final expenseTracker = ExpensesTracker(
          List.empty(growable: true)..add(expense),
          name: state.trackerName,
          authorizedUsers: state.addedPeople,
          createdAt: DateTime.now(),
          currency: 'USD',
          ownerId: user.uid,
          id: uuid.v1(),
          totalExpenses: state.expenseAmount,
        );

        await _dataRepository.createExpenseTracker(expenseTracker);
      });
    });
  }

  final DataRepositoryInterface _dataRepository;
  final AuthenticationRepositoryInterface _authRepository;
}
