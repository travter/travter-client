part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState{
  const factory EditProfileState({
    required String username, // value object todo plox
    required String photoReference,
    required String bio,
  }) = _EditProfileState;

  factory EditProfileState.initial() => const EditProfileState(
    username: '',
    photoReference: '',
    bio: '',
  );
}

