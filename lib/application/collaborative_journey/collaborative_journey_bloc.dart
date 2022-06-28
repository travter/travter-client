import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'collaborative_journey_event.dart';
part 'collaborative_journey_state.dart';


class CollaborativeJourneyBloc extends Bloc<CollaborativeJourneyEvent, CollaborativeJourneyState> {
  CollaborativeJourneyBloc() : super(CollaborativeJourneyInitial()) {
    on<CollaborativeJourneyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
