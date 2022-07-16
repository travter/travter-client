part of 'authentication_bloc.dart';

enum AuthenticationStatus {initial, authenticated, unauthenticated}

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    required User user,
    required AuthenticationStatus authStatus,
  }) = _AuthenticationState;

  factory AuthenticationState.initial() => AuthenticationState(
    user: User.empty(),
    authStatus: AuthenticationStatus.initial,
  );

  // const factory AuthenticationState.authenticated() = Authenticated;

  // const factory AuthenticationState.unauthenticated() = Unauthenticated;
}

