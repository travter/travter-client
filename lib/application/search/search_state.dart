part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required String query,
    required Option<String> searchResult,
  }) = _SearchState;

  factory SearchState.initial() => SearchState(
        query: '',
        searchResult: none(),
      );
}
