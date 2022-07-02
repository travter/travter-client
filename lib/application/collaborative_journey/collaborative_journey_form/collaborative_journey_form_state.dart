part of 'collaborative_journey_form_bloc.dart';

@freezed
class CollaborativeJourneyFormState with _$CollaborativeJourneyFormState {
  const factory CollaborativeJourneyFormState({
    required String journeyName,
    required String memoryName,
    required String memoryDescription,
    required List<String> addedPeople,
    required List<String> addedPhotos,
    required Option<RequestResult> requestResult,
  }) = _CollaborativeJourneyFormState;

  factory CollaborativeJourneyFormState.initial() =>
      CollaborativeJourneyFormState(
        journeyName: '',
        memoryName: '',
        memoryDescription: '',
        addedPeople: [],
        addedPhotos: [],
        requestResult: none(),
      );
}
