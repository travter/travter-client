part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = Initial;

  const factory AuthenticationState.authenticated() = Authenticated;

  const factory AuthenticationState.unauthenticated() = Unauthenticated;
}
