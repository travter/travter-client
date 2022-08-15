part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.userSignedIn(User user) = UserSignedIn;

  const factory UserEvent.signedOut() = SignedOut;

  const factory UserEvent.userStateUpdated(User user) = UserStateUpdated;

  const factory UserEvent.fetchUserDataRequested() = FetchUserDataRequested;

  const factory UserEvent.journeyLikeToggled(String journeyId) =
      JourneyLikeToggled;

  const factory UserEvent.currentlyLookedUpUserSet(User user) =
      CurrentlyLookedUpUserSet;

  const factory UserEvent.userFollowToggled(String userId) = UserFollowToggled;
  const factory UserEvent.addToFriendsPressed(String userId) =
      AddToFriendsPressed;
}
