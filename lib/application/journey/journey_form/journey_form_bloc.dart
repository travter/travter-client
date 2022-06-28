import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'journey_form_event.dart';
part 'journey_form_state.dart';

class JourneyFormBloc extends Bloc<JourneyFormEvent, JourneyFormState> {
  JourneyFormBloc() : super(JourneyFormInitial()) {
    on<JourneyFormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
