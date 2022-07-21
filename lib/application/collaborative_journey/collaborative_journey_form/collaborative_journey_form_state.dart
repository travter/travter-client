part of 'collaborative_journey_form_bloc.dart';


@freezed
class CollaborativeJourneyFormState with _$CollaborativeJourneyFormState {
  const factory CollaborativeJourneyFormState({
    required String journeyName,
    required String memoryName,
    required String memoryDescription,
    required AddPeopleStatus addPeopleStatus,
    required List<String> selectedUsers,
    required List<String> addedPhotos,
    required Option<RequestResult<Unit>> requestResult,
  }) = _CollaborativeJourneyFormState;

  factory CollaborativeJourneyFormState.initial() =>
      CollaborativeJourneyFormState(
        journeyName: '',
        memoryName: '',
        memoryDescription: '',
        addPeopleStatus: AddPeopleStatus.initial,
        selectedUsers: [],
        addedPhotos: [],
        requestResult: none(),
      );
}
