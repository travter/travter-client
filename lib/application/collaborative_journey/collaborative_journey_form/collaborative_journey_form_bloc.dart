import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:data_repository/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../infrastructure/core/constants/enums.dart';

part 'collaborative_journey_form_bloc.freezed.dart';

part 'collaborative_journey_form_event.dart';

part 'collaborative_journey_form_state.dart';

class CollaborativeJourneyFormBloc
    extends Bloc<CollaborativeJourneyFormEvent, CollaborativeJourneyFormState> {
  CollaborativeJourneyFormBloc(this._authRepository, this._dataRepository)
      : super(CollaborativeJourneyFormState.initial()) {
    on<JourneyNameChanged>((event, emit) {
      emit(state.copyWith(journeyName: event.name));
    });
    on<MemoryNameChanged>((event, emit) {
      emit(state.copyWith(memoryName: event.name));
    });
    on<MemoryDescriptionChanged>((event, emit) {
      emit(state.copyWith(memoryDescription: event.description));
    });
    on<AddPeopleStarted>((event, emit) {
      emit(state.copyWith(addPeopleStatus: AddPeopleStatus.started));
    });
    on<AddPeopleFinished>((event, emit) {
      emit(state.copyWith(addPeopleStatus: AddPeopleStatus.finished));
    });
    on<UploadPhotosStarted>((event, emit) {});
    on<SubmitFormPressed>((event, emit) async {
      final currentUser = await _authRepository.getSignedInUser();
      const uuid = Uuid();

      await currentUser.fold(() => null, (user) async {
        final memory = Memory(
          id: uuid.v1(),
          description: state.memoryDescription,
          ownerId: user.uid,
          name: state.memoryName,
          photos: List.empty(growable: true),
        );

        final collaborativeJourney = CollaborativeJourney(
          List.empty(growable: true)..add(memory),
          name: state.journeyName,
          authorizedUsers: state.addedPeople,
          ownerId: user.uid,
          id: uuid.v1(),
        );
        final result = await _dataRepository
            .createCollaborativeJourney(collaborativeJourney);
        emit(state.copyWith(
          requestResult: optionOf(result),
        ));
      });
    });
  }

  final AuthenticationRepositoryInterface _authRepository;
  final DataRepositoryInterface _dataRepository;
}
