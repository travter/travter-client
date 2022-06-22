import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_bloc.freezed.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepositoryInterface _authRepo;

  AuthenticationBloc(this._authRepo)
      : super(const AuthenticationState.initial()) {
    on<AuthCheckRequested>((event, emit) async {
      final userOption = await _authRepo.getSignedInUser();
      emit(userOption.fold(
        () => const AuthenticationState.unauthenticated(),
        (_) => const AuthenticationState.authenticated(),
      ));
    });
    on<SignedOut>((event, emit) async {
      await _authRepo.signOut();
      emit(const AuthenticationState.unauthenticated());
    });
  }
}
