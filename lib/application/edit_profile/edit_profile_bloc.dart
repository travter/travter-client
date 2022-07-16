import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_bloc.freezed.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileState.initial()) {
    on<UsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });
    on<ProfilePhotoSelectionStarted>((event, emit) {});
    on<ProfilePhotoChanged>((event, emit) {
      emit(state.copyWith(photoReference: event.photoReference));
    });
    on<BioChanged>((event, emit) {
      emit(state.copyWith(bio: event.bio));
    });
    on<SubmitFormPressed>((event, emit) {});
  }
}
