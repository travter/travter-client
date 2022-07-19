part of 'journey_bloc.dart';


@freezed
class JourneyState with _$JourneyState{
    const factory JourneyState({
        required JourneysFeedStatus status,
        required List<Journey> journeys,
        required Journey? currentlyLookedUpJourney,
        required List<Journey> likedJourneys,
    }) = _JourneyState;

    factory JourneyState.initial() => const JourneyState(
        status: JourneysFeedStatus.initial,
        journeys: [],
        currentlyLookedUpJourney: null,
        likedJourneys: [],
    );
}