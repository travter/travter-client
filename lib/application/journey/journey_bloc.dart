import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../infrastructure/core/constants/enums.dart';

part 'journey_bloc.freezed.dart';

part 'journey_event.dart';

part 'journey_state.dart';

class JourneyBloc extends Bloc<JourneyEvent, JourneyState> {
  JourneyBloc(this._dataRepository, this._authRepository)
      : super(JourneyState.initial()) {
    on<FetchJourneysRequested>((event, emit) async {
      emit(state.copyWith(status: JourneysFeedStatus.fetching));

      final user = await _authRepository.getSignedInUser();
      await user.fold(() {
        emit(state.copyWith(
          status: JourneysFeedStatus.failure,
        ));
      }, (user) async {
        final journeys = await _dataRepository.getAllUsersJourneys(user.uid);
        await journeys.fold((_) => null, (stream) async {
          await emit.forEach(
            stream,
            onData: (List<Journey> data) => state.copyWith(
              status: JourneysFeedStatus.success,
              journeys: data,
            ),
            onError: (_, __) => state.copyWith(
              status: JourneysFeedStatus.failure,
            ),
          );
        });
      });
    });

    on<CurrentlyLookedUpJourneySet>((event, emit) async {
      emit(state.copyWith(
        currentlyLookedUpJourney: event.journey,
      ));
    });

    on<LikedJourneysRequested>((event, emit) async {
      final likedJourneys = <Journey>[];
      for (final journey in state.journeys) {
        if (event.journeyIds.contains(journey.id)) {
          likedJourneys.add(journey);
        }
      }
      emit(state.copyWith(
        likedJourneys: likedJourneys,
      ));
    });
  }

  final DataRepositoryInterface _dataRepository;
  final AuthenticationRepositoryInterface _authRepository;
}
