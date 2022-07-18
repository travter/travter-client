import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'search_bloc.freezed.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._dataRepository) : super(SearchState.initial()) {
    on<QueryChanged>((event, emit) {
      emit(state.copyWith(
        query: event.query,
      ));
    });

    on<SearchPressed>((event, emit) async {
      final searchResult = await _dataRepository.performSearch(state.query);
      searchResult.fold((l){
        emit(state.copyWith(
         // cos kiedys trza zrobic jakies error state
        ));
      }, (result) {
        emit(state.copyWith(
          searchResult: result,
        ));
      });
    });
  }

  final DataRepositoryInterface _dataRepository;
}
