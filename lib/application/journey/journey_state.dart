part of 'journey_bloc.dart';

enum JourneysFeedStatus { initial, fetching, success, failure }

@freezed
class JourneyState with _$JourneyState{
    const factory JourneyState({
        required JourneysFeedStatus status,
        required List<Journey> journeys,
        required Journey? currentlyLookedUpJourney,
    }) = _JourneyState;

    factory JourneyState.initial() => const JourneyState(
        status: JourneysFeedStatus.initial,
        journeys: [],
        currentlyLookedUpJourney: null,
    );
}