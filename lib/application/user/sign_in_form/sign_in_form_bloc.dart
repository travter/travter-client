import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:data_repository/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_form_bloc.freezed.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc(this._authFacade, this._dataRepository)
      : super(SignInFormState.initial()) {
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
      AuthResult failureOrSuccess =
          left(const AuthFailure.invalidEmailOrPassword());

      final isEmailValid = state.email.isValid();
      final isPasswordValid = state.password.isValid();

      if (isEmailValid && isPasswordValid) {
        emit(state.copyWith(
          isSubmitting: true,
          authResult: none(),
        ));

        failureOrSuccess = await _authFacade.signInWithEmail(
            email: state.email, password: state.password);

        await failureOrSuccess.fold((l) => null, (_) async {
          final currentUser = await _authFacade.getSignedInUser();
          await currentUser.fold(() => null, (user) async {
            // await _dataRepository.saveAndRetrieveUser(user);
          });
        });
      }

      emit(state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authResult: optionOf(failureOrSuccess),
      ));
    });
    on<SignInWithEmailAndPasswordPressed>((event, emit) async {
      AuthResult failureOrSuccess =
          left(const AuthFailure.invalidEmailOrPassword());

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
      await result.fold((l) => null, (_) async {
        final currentUser = await _authFacade.getSignedInUser();
        await currentUser.fold(() => null, (user) async {
          await _dataRepository.saveAndRetrieveUser(user);
        });
      });

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
      await result.fold((l) => null, (_) async {
        final currentUser = await _authFacade.getSignedInUser();
        await currentUser.fold(() => null, (user) async {
          final _user = await _dataRepository.saveAndRetrieveUser(user);
          await _user.fold((l) => null, (user) async {
            emit(state.copyWith(
              signedUser: user,
              isSubmitting: false,
              authResult: some(result),
            ));
          });
        });
      });
    });
  }
  final AuthenticationRepositoryInterface _authFacade;
  final DataRepositoryInterface _dataRepository;
}
