import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'journey_event.dart';
part 'journey_state.dart';

class JourneyBloc extends Bloc<JourneyEvent, JourneyState> {
  JourneyBloc() : super(JourneyInitial()) {
    on<JourneyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
