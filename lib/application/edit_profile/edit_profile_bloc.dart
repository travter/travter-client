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
  EditProfileBloc(this._functionalitiesRepository, this._dataRepository)
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
      final result = await _dataRepository.saveImagesToStorage(paths);
      result.fold((l) {
        emit(state.copyWith(
          editionResult: left(const EditionFailure.failedToSaveImage()),
        ));
      }, (r) {});
    });
  }

  final FunctionalitiesRepositoryInterface _functionalitiesRepository;
  final DataRepositoryInterface _dataRepository;
}
