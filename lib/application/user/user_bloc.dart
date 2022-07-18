import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_bloc.freezed.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc
    extends Bloc<UserEvent, UserState> {
  UserBloc(this._authRepo, this._dataRepository) : super(UserState.initial()) {
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

    on<ToggleJourneyLike>((event, emit) async {
      final signedUser = await _authRepo.getSignedInUser();
      await signedUser.fold(() => null, (user) async {
        var isLiked = false;
        for(final id in state.user.likedPostsIds){
          if(id == event.journeyId){
            isLiked = true;
            break;
          }
        }
        var newLikedPostsIds = <String>[];
        if(!isLiked) {
          await _dataRepository.addJourneyToFavorites(user.uid, event.journeyId);
          newLikedPostsIds = [...state.user.likedPostsIds, event.journeyId];
        } else {
          await _dataRepository.removeJourneyFromFavorites(user.uid, event.journeyId);
          final currentLikedPostsIds = List<String>.from(state.user.likedPostsIds);
          currentLikedPostsIds.remove(event.journeyId);
          newLikedPostsIds = currentLikedPostsIds;
        }

        emit(state.copyWith(
          user: User(
            state.user.friends,
            username: state.user.username,
            likedPostsIds: newLikedPostsIds,
            bio: state.user.bio,
            uid: state.user.uid,
            expensesTrackers: state.user.expensesTrackers,
            firstName: state.user.firstName,
            lastName: state.user.lastName,
            followers: state.user.followers,
            following: state.user.following,
            posts: state.user.posts,
            profilePicture: state.user.profilePicture
          ),
        ));
      });
    });
  }

  final AuthenticationRepositoryInterface _authRepo;
  final DataRepositoryInterface _dataRepository;
}