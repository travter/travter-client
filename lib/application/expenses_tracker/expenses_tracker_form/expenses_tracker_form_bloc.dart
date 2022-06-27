import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenses_tracker_form_event.dart';
part 'expenses_tracker_form_state.dart';

part 'expenses_tracker_form_bloc.freezed.dart';

class ExpensesTrackerFormBloc extends Bloc<ExpensesTrackerFormEvent, ExpensesTrackerFormState> {
  ExpensesTrackerFormBloc() : super(ExpensesTrackerFormInitial()) {
    on<ExpensesTrackerFormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
