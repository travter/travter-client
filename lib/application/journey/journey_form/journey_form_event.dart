part of 'journey_form_bloc.dart';

@freezed
class JourneyFormEvent with _$JourneyFormEvent {
  const factory JourneyFormEvent.nameChanged(String name) = NameChanged;
  const factory JourneyFormEvent.visitedPlacesChanged(List<String> places) = VisitedPlacesChanged;
  const factory JourneyFormEvent.descriptionChanged(String description) = DescriptionChanged;
  const factory JourneyFormEvent.uploadPhotosStarted() = UploadPhotosStarted;
  const factory JourneyFormEvent.dateSelected(String date) = PickDatePressed;
  const factory JourneyFormEvent.submitFormPressed() = SubmitFormPressed;
}