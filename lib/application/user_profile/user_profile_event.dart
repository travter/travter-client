part of 'user_profile_bloc.dart';

@freezed
class UserProfileEvent with _$UserProfileEvent{
  const factory UserProfileEvent.usernameChanged() = UsernameChanged;
  const factory UserProfileEvent.bioChanged() = BioChanged;
}
