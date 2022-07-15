import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:data_repository/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:functionalities_repository/functionalities_repository.dart';
import 'package:uuid/uuid.dart';

part 'journey_form_bloc.freezed.dart';

part 'journey_form_event.dart';

part 'journey_form_state.dart';

class JourneyFormBloc extends Bloc<JourneyFormEvent, JourneyFormState> {
  JourneyFormBloc(this._authRepository, this._dataRepository,
      this._functionalitiesRepository)
      : super(JourneyFormState.initial()) {
    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
    on<VisitedPlacesChanged>((event, emit) {
      emit(state.copyWith(visitedPlaces: event.places));
    });
    on<DescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });
    on<UploadPhotosStarted>((event, emit) async {
      final imagesPaths =
          await _functionalitiesRepository.selectAndSaveImages();
      imagesPaths.fold((l) => null, (paths) {
        if (paths == null) {
          return;
        }
        emit(state.copyWith(
          uploadedPhotos: paths,
        ));
      });
    });
    on<PickDatePressed>((event, emit) async {
      emit(state.copyWith(
        startDate: event.date,
      ));
    });
    on<SubmitFormPressed>((event, emit) async {
      final currentUser = await _authRepository.getSignedInUser();

      const uuid = Uuid();
      final imageNames = state.uploadedPhotos
          .map((e) => 'images/${e.split('/').last}')
          .toList();

      await currentUser.fold(() => null, (user) async {
        final journey = Journey(
          name: state.name,
          visitedPlaces: state.visitedPlaces,
          description: state.description,
          photos: imageNames,
          ownerId: user.uid,
          id: uuid.v1(),
          startDate: DateTime.now(),
        );
        final _result = await _dataRepository.createJourney(journey);
        await _dataRepository.saveImagesToStorage(state.uploadedPhotos);

        emit(
          state.copyWith(
            requestResult: optionOf(_result),
          ),
        );
      });
    });
  }

  final DataRepositoryInterface _dataRepository;
  final AuthenticationRepositoryInterface _authRepository;
  final FunctionalitiesRepositoryInterface _functionalitiesRepository;
}
