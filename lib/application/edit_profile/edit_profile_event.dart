part of 'edit_profile_bloc.dart';

@freezed
class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.usernameChanged(String username) = UsernameChanged;
  const factory EditProfileEvent.profilePhotoSelectionStarted() = ProfilePhotoSelectionStarted;
  const factory EditProfileEvent.profilePhotoChanged(String photoReference) = ProfilePhotoChanged;
  const factory EditProfileEvent.bioChanged(String bio) = BioChanged;
  const factory EditProfileEvent.submitFormPressed() = SubmitFormPressed;
}