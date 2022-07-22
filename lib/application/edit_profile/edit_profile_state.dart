part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    required String username, // value object todo plox
    required String photoReference,
    required String bio,
    required String firstName,
    required String lastName,
    required Option<Either<EditionFailure, Unit>> editionResult,
  }) = _EditProfileState;

  factory EditProfileState.initial() => EditProfileState(
        username: '',
        photoReference: '',
        bio: '',
        firstName: '',
        lastName: '',
        editionResult: none(),
      );
}
