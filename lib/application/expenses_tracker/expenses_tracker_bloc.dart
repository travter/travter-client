import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'expenses_tracker_bloc.freezed.dart';

part 'expenses_tracker_event.dart';

part 'expenses_tracker_state.dart';

class ExpensesTrackerBloc
    extends Bloc<ExpensesTrackerEvent, ExpensesTrackerState> {
  ExpensesTrackerBloc(this._dataRepository, this._authRepository)
      : super(ExpensesTrackerState.initial()) {
    on<FetchTrackersRequested>((event, emit) async {
      emit(state.copyWith(status: TrackersOverviewStatus.fetching));

      final user = await _authRepository.getSignedInUser();
      await user.fold(() {
        emit(state.copyWith(
          status: TrackersOverviewStatus.failure,
        ));
      }, (user) async {
        final trackers =
            await _dataRepository.getAllUsersExpenseTrackers(user.uid);
        await trackers.fold((_) => null, (stream) async {
          await emit.forEach(
            stream,
            onData: (data) => state.copyWith(
              status: TrackersOverviewStatus.success,
              trackers: data,
            ),
            onError: (_, __) => state.copyWith(
              status: TrackersOverviewStatus.failure,
            ),
          );
        });
      });
    });

    on<CurrentlyLookedUpTrackerSet>((event, emit) {
      emit(state.copyWith(currentlyLookedUpTracker: event.tracker));
    });
  }

  final DataRepositoryInterface _dataRepository;
  final AuthenticationRepositoryInterface _authRepository;
}
