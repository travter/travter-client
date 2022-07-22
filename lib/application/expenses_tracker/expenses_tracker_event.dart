part of 'expenses_tracker_bloc.dart';

@freezed
class ExpensesTrackerEvent with _$ExpensesTrackerEvent {
  const factory ExpensesTrackerEvent.fetchTrackersRequested() =
      FetchTrackersRequested;
  const factory ExpensesTrackerEvent.currentlyLookedUpTrackerSet(
      ExpensesTracker tracker) = CurrentlyLookedUpTrackerSet;

}
