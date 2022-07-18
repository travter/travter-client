import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:data_repository/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:functionalities_repository/functionalities_repository.dart';

import '../../domain/edit_profile/edition_failure.dart';

part 'edit_profile_bloc.freezed.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(this._functionalitiesRepository, this._dataRepository, this._authRepository)
      : super(EditProfileState.initial()) {
    on<UsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });
    on<ProfilePhotoSelectionStarted>((event, emit) async {
      final imagesPaths =
          await _functionalitiesRepository.selectAndSaveImages(multiple: false);
      imagesPaths.fold((l) => null, (paths) {
        if (paths == null) {
          return;
        }
        emit(state.copyWith(
          photoReference: paths.first,
        ));
      });
    });
    on<ProfilePhotoChanged>((event, emit) {
      emit(state.copyWith(photoReference: event.photoReference));
    });
    on<BioChanged>((event, emit) {
      emit(state.copyWith(bio: event.bio));
    });
    on<SubmitFormPressed>((event, emit) async {
      final paths = [state.photoReference];
      final currentUser = await _authRepository.getSignedInUser();
      await currentUser.fold(() => null, (user) async {
        final result = await _dataRepository.saveImagesToStorage(paths);
        await result.fold((_) {
          emit(state.copyWith(
            editionResult: some(left(const EditionFailure.failedToSaveImage())),
          ));
        }, (_) async {
          final fieldsToUpdate = {
            'username': state.username,
            'profilePicture': state.photoReference.split('/').last,
            'bio': state.bio,
            'firstName': state.firstName,
            'lastName': state.lastName,
          };

          final updateResult = await _dataRepository.updateUser(fieldsToUpdate, user.uid);
          updateResult.fold((_) {
            emit(state.copyWith(
              editionResult: some(left(const EditionFailure.unknownError())),
            ));
          }, (_) {
            emit(state.copyWith(
              editionResult: some(right(unit)),
            ));
          });
        });
      });
    });
  }

  final FunctionalitiesRepositoryInterface _functionalitiesRepository;
  final DataRepositoryInterface _dataRepository;
  final AuthenticationRepositoryInterface _authRepository;
}
