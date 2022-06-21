import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/authentication/authentication_facade_interface.dart';

part 'authentication_bloc.freezed.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationFacadeInterface _authFacade;

  AuthenticationBloc(this._authFacade)
      : super(const AuthenticationState.initial()) {
    on<AuthCheckRequested>((event, emit) async {
      final userOption = await _authFacade.getSignedInUser();
      emit(userOption.fold(
        () => const AuthenticationState.unauthenticated(),
        (_) => const AuthenticationState.authenticated(),
      ));
    });
    on<SignedOut>((event, emit) async {
      await _authFacade.signOut();
      emit(const AuthenticationState.unauthenticated());
    });
  }
}
