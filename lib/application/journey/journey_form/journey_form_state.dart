part of 'journey_form_bloc.dart';

@freezed
class JourneyFormState with _$JourneyFormState {
  const factory JourneyFormState({
    required String name,
    required List<String> visitedPlaces,
    required String description,
    required List<String> uploadedPhotos,
  }) = _JourneyFormState;

  factory JourneyFormState.initial() => JourneyFormState(
        name: '',
        visitedPlaces: List.empty(growable: true),
        description: '',
        uploadedPhotos: List.empty(growable: true),
      );
}
