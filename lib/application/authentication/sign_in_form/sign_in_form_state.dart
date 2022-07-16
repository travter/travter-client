part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required EmailAddress email,
    required Password password,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<AuthResult> authResult,
    required User signedUser,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        email: EmailAddress(''),
        password: Password(''),
        showErrorMessages: false,
        isSubmitting: false,
        authResult: none(),
        signedUser: User.empty(),
      );
}
