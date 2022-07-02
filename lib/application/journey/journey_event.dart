part of 'journey_bloc.dart';


@freezed
class JourneyEvent with _$JourneyEvent{
  const factory JourneyEvent.fetchJourneysRequested() = FetchJourneysRequested;
const factory JourneyEvent.currentlyLookedUpJourneySet(Journey journey) = CurrentlyLookedUpJourneySet;
}
