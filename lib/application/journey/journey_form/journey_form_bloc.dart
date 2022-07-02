import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:data_repository/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'journey_form_bloc.freezed.dart';

part 'journey_form_event.dart';

part 'journey_form_state.dart';

class JourneyFormBloc extends Bloc<JourneyFormEvent, JourneyFormState> {
  JourneyFormBloc(this._authRepository, this._dataRepository)
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
    on<UploadPhotosStarted>((event, emit) {});
    on<SubmitFormPressed>((event, emit) async {
      final currentUser = await _authRepository.getSignedInUser();

      const uuid = Uuid();
      await currentUser.fold(() => null, (user) async {
        final journey = Journey(
          name: state.name,
          visitedPlaces: state.visitedPlaces,
          description: state.description,
          photos: state.uploadedPhotos,
          ownerId: user.uid,
          id: uuid.v1(),
          startDate: DateTime.now(),
        );
        final _result = await _dataRepository.createJourney(journey);

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
}
