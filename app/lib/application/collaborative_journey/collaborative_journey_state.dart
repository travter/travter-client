part of 'collaborative_journey_bloc.dart';

// consider making it neutral for rest of the blocs
enum CollaborativeJourneyFeedStatus { initial, fetching, success, failure }

@freezed
class CollaborativeJourneyState with _$CollaborativeJourneyState {
  const factory CollaborativeJourneyState({
    required CollaborativeJourneyFeedStatus status,
    required List<CollaborativeJourney> journeys,
  }) = _CollaborativeJourneyState;


  factory CollaborativeJourneyState.initial() =>
      const CollaborativeJourneyState(
        status: CollaborativeJourneyFeedStatus.initial,
        journeys: [],
      );
}
