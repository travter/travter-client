part of 'expenses_tracker_bloc.dart';

@freezed
class ExpensesTrackerState with _$ExpensesTrackerState {
  const factory ExpensesTrackerState({
    required TrackersOverviewStatus status,
    required List<ExpensesTracker> trackers,
    required List<ExpensesTracker> authorizedTrackers,
    required ExpensesTracker? currentlyLookedUpTracker,
  }) = _ExpensesTrackerState;

  factory ExpensesTrackerState.initial() => const ExpensesTrackerState(
        status: TrackersOverviewStatus.initial,
        trackers: [],
        currentlyLookedUpTracker: null,
        authorizedTrackers: [],
      );
}
