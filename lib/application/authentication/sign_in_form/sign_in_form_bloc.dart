import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


part 'sign_in_form_bloc.freezed.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final AuthenticationRepositoryInterface _authFacade;

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
      AuthResult failureOrSuccess = left(const AuthFailure.invalidEmailOrPassword());


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
      AuthResult failureOrSuccess = left(AuthFailure.invalidEmailOrPassword());

      final isEmailValid = state.email.isValid();
      final isPasswordValid = state.password.isValid();

      if (isEmailValid && isPasswordValid) {
        emit(state.copyWith(
          isSubmitting: true,
          authResult: none(),
        ));


        failureOrSuccess = await _authFacade.loginWithEmail(
          email: state.email,
          password: state.password,
        );
      }

      emit(state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authResult: optionOf(failureOrSuccess),
      ));
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
 
}
