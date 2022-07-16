import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_bloc.freezed.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._authRepo) : super(AuthenticationState.initial()) {
    on<AuthCheckRequested>((event, emit) async {
      final userOption = await _authRepo.getSignedInUser();
      userOption.fold(
        () {
          emit(state.copyWith(
            authStatus: AuthenticationStatus.unauthenticated,
          ));
        },
        (_) {
          emit(state.copyWith(
            authStatus: AuthenticationStatus.authenticated,
          ));
        },
      );
    });
    on<SignedOut>((event, emit) async {
      await _authRepo.signOut();
      emit(state.copyWith(
        authStatus: AuthenticationStatus.unauthenticated,
      ));
    });

    on<UserSignedIn>((event, emit) async {
      emit(state.copyWith(
        user: event.user,
      ));
    });
  }

  final AuthenticationRepositoryInterface _authRepo;
}
