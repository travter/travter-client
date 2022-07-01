part of 'expenses_tracker_bloc.dart';

enum TrackersOverviewStatus { initial, fetching, success, failure }

@freezed
class ExpensesTrackerState with _$ExpensesTrackerState {
  const factory ExpensesTrackerState({
    required TrackersOverviewStatus status,
    required List<ExpensesTracker> trackers,
    required ExpensesTracker? currentlyLookedUpTracker,
  }) = _ExpensesTrackerState;

  factory ExpensesTrackerState.initial() => const ExpensesTrackerState(
        status: TrackersOverviewStatus.initial,
        trackers: [],
        currentlyLookedUpTracker: null,
      );
}
