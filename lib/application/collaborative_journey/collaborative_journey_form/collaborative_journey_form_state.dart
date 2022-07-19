part of 'collaborative_journey_form_bloc.dart';

enum AddPeopleStatus { started, added, initial }

@freezed
class CollaborativeJourneyFormState with _$CollaborativeJourneyFormState {
  const factory CollaborativeJourneyFormState({
    required String journeyName,
    required String memoryName,
    required String memoryDescription,
    required AddPeopleStatus addPeopleStatus,
    required List<String> addedPeople,
    required List<String> addedPhotos,
    required Option<RequestResult<Unit>> requestResult,
  }) = _CollaborativeJourneyFormState;

  factory CollaborativeJourneyFormState.initial() =>
      CollaborativeJourneyFormState(
        journeyName: '',
        memoryName: '',
        memoryDescription: '',
        addPeopleStatus: AddPeopleStatus.initial,
        addedPeople: [],
        addedPhotos: [],
        requestResult: none(),
      );
}
