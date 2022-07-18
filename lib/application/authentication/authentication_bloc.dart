import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_bloc.freezed.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._authRepo, this._dataRepository) : super(AuthenticationState.initial()) {
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

    on<UserStateUpdated>((event, emit) async {
      emit(state.copyWith(
        user: event.user,
      ));
    });

    on<FetchUserDataRequested>((event,emit) async {
      final signedUser = await _authRepo.getSignedInUser();
      await signedUser.fold(() => null, (user) async {
        final _user = await _dataRepository.getUserData(user.uid);
        _user.fold((l) => null, (user){
          emit(state.copyWith(
            user: user,
          ));
        });
      });
    });

    on<AddJourneyToFavorites>((event, emit) async {
      final signedUser = await _authRepo.getSignedInUser();
      await signedUser.fold(() => null, (user) async {
        await _dataRepository.addJourneyToFavorites(user.uid, event.journeyId);
      });
    });
  }

  final AuthenticationRepositoryInterface _authRepo;
  final DataRepositoryInterface _dataRepository;
}
