import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/authentication/auth_failure.dart';
import '../../../domain/authentication/authentication_facade_interface.dart';
import '../../../domain/authentication/value_objects.dart';
import '../../../domain/core/typedefs.dart';

part 'sign_in_form_bloc.freezed.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final AuthenticationFacadeInterface _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
        email: EmailAddress(event.email),
        authResult: none(),
      ));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: Password(event.password),
        authResult: none(),
      ));
    });

    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
      AuthResult failureOrSuccess = right(unit);

      final isEmailValid = state.email.isValid();
      final isPasswordValid = state.password.isValid();

      if (isEmailValid && isPasswordValid) {
        emit(state.copyWith(
          isSubmitting: true,
          authResult: none(),
        ));

        failureOrSuccess = await _authFacade.signInWithEmail(
            email: state.email, password: state.password);
      }

      emit(state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authResult: optionOf(failureOrSuccess),
      ));
    });
    on<SignInWithEmailAndPasswordPressed>((event, emit) async {
      _performActionOnAuthFacade(_authFacade.loginWithEmail);
    });
    on<SignInWithFacebookPressed>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
        authResult: none(),
      ));
      final result = await _authFacade.loginWithFacebook();
      emit(state.copyWith(
        isSubmitting: false,
        authResult: some(result),
      ));
    });
    on<SignInWithGooglePressed>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
        authResult: none(),
      ));
      final result = await _authFacade.loginWithGoogle();

      emit(state.copyWith(
        isSubmitting: false,
        authResult: some(result),
      ));

    });
  }

  Stream<SignInFormState> _performActionOnAuthFacade(
    Future<AuthResult> Function({
      required EmailAddress email,
      required Password password,
    })
        forwardedCall,
  ) async* {
    AuthResult failureOrSuccess = right(unit);

    final isEmailValid = state.email.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authResult: none(),
      );

      failureOrSuccess = await forwardedCall(
        email: state.email,
        password: state.password,
      );
    }

    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authResult: optionOf(failureOrSuccess),
    );
  }
}
