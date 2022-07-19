part of 'collaborative_journey_bloc.dart';

@freezed
class CollaborativeJourneyEvent with _$CollaborativeJourneyEvent {
  const factory CollaborativeJourneyEvent.fetchJourneysRequested() =
      FetchJourneysRequested;
}
