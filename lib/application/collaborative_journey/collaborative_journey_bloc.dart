import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collaborative_journey_bloc.freezed.dart';

part 'collaborative_journey_event.dart';

part 'collaborative_journey_state.dart';

class CollaborativeJourneyBloc
    extends Bloc<CollaborativeJourneyEvent, CollaborativeJourneyState> {
  CollaborativeJourneyBloc(this._dataRepository, this._authRepository)
      : super(CollaborativeJourneyState.initial()) {

    on<FetchJourneysRequested>((event, emit) async {
      emit(state.copyWith(
        status: CollaborativeJourneyFeedStatus.fetching,
      ));

      final user = await _authRepository.getSignedInUser();
      await user.fold(() {
        emit(state.copyWith(
          status: CollaborativeJourneyFeedStatus.failure,
        ));
      }, (user) async {
        final journeys =
            await _dataRepository.getAllUsersCollaborativeJourneys(user.uid);
        await journeys.fold((_) {
          emit(state.copyWith(
            status: CollaborativeJourneyFeedStatus.failure,
          ));
        }, (stream) async {
          await emit.forEach(
            stream,
            onData: (data) => state.copyWith(
              status: CollaborativeJourneyFeedStatus.success,
              journeys: data,
            ),
            onError: (_, __) => state.copyWith(
              status: CollaborativeJourneyFeedStatus.failure,
            ),
          );
        });
      });
    });
  }

  final DataRepositoryInterface _dataRepository;
  final AuthenticationRepositoryInterface _authRepository;
}
