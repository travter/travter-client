import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'expenses_tracker_event.dart';
part 'expenses_tracker_state.dart';

class ExpensesTrackerBloc extends Bloc<ExpensesTrackerEvent, ExpensesTrackerState> {
  ExpensesTrackerBloc() : super(ExpensesTrackerInitial()) {
    on<ExpensesTrackerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
