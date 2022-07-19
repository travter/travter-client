import 'package:auth_repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data_repository.dart';

part 'search_result.freezed.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required List<Journey> foundJourneys,
    // required List<CollaborativeJourney> foundCollaborativeJourneys // TODO in later versions
    required List<User> foundUsers,
  }) = _SearchResult;

  factory SearchResult.empty() => const SearchResult(
        foundJourneys: [],
        foundUsers: [],
      );
}
