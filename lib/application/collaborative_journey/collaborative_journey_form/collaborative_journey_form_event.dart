part of 'collaborative_journey_form_bloc.dart';

@freezed
class CollaborativeJourneyFormEvent with _$CollaborativeJourneyFormEvent {
  const factory CollaborativeJourneyFormEvent.journeyNameChanged(String name) =
      JourneyNameChanged;
  const factory CollaborativeJourneyFormEvent.memoryNameChanged(String name) =
      MemoryNameChanged;
  const factory CollaborativeJourneyFormEvent.memoryDescriptionChanged(
      String description) = MemoryDescriptionChanged;
  const factory CollaborativeJourneyFormEvent.addPeopleStarted() =
      AddPeopleStarted;
  const factory CollaborativeJourneyFormEvent.selectedPeopleChanged(
      List<String> people) = SelectedPeopleChanged;
  const factory CollaborativeJourneyFormEvent.addPeopleFinished() =
      AddPeopleFinished;
  const factory CollaborativeJourneyFormEvent.uploadPhotosStarted() =
      UploadPhotosStarted;
  const factory CollaborativeJourneyFormEvent.submitFormPressed() =
      SubmitFormPressed;
}
