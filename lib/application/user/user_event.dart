part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent{
  const factory UserEvent.authCheckRequested() = AuthCheckRequested;
  const factory UserEvent.userSignedIn(User user) = UserSignedIn;
  const factory UserEvent.signedOut() = SignedOut;
  const factory UserEvent.userStateUpdated(User user) = UserStateUpdated;
  const factory UserEvent.fetchUserDataRequested() = FetchUserDataRequested;
  const factory UserEvent.toggleJourneyLike(String journeyId)  = ToggleJourneyLike;
}
