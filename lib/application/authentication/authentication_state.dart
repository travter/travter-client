part of 'authentication_bloc.dart';

enum AuthenticationStatus {initial, authenticated, unauthenticated}

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    required Option<User> user,
    required AuthenticationStatus authStatus,
  }) = _AuthenticationState;

  factory AuthenticationState.initial() => AuthenticationState(
    user: none(),
    authStatus: AuthenticationStatus.initial,
  );

  // const factory AuthenticationState.authenticated() = Authenticated;

  // const factory AuthenticationState.unauthenticated() = Unauthenticated;
}

