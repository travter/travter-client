import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'collaborative_journey_form_event.dart';
part 'collaborative_journey_form_state.dart';

class CollaborativeJourneyFormBloc extends Bloc<CollaborativeJourneyFormEvent, CollaborativeJourneyFormState> {
  CollaborativeJourneyFormBloc() : super(CollaborativeJourneyFormInitial()) {
    on<CollaborativeJourneyFormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
