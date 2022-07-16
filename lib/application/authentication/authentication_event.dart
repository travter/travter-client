part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.authCheckRequested() = AuthCheckRequested;
  const factory AuthenticationEvent.userSignedIn(User user) = UserSignedIn;
  const factory AuthenticationEvent.signedOut() = SignedOut;
}
