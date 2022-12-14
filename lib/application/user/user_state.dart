part of 'user_bloc.dart';

enum AuthenticationStatus { initial, authenticated, unauthenticated }

@freezed
class UserState with _$UserState {
  const factory UserState({
    required User user,
    required AuthenticationStatus authStatus,
    required User currentlyLookedUpUser,
  }) = _UserState;

  factory UserState.initial() => UserState(
        user: User.empty(),
        authStatus: AuthenticationStatus.initial,
        currentlyLookedUpUser: User.empty(),
      );

// const factory AuthenticationState.authenticated() = Authenticated;

// const factory AuthenticationState.unauthenticated() = Unauthenticated;
}
