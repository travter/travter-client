import 'package:freezed_annotation/freezed_annotation.dart';

import 'memory.dart';

part 'collaborative_journey.freezed.dart';

part 'collaborative_journey.g.dart';

@freezed
class CollaborativeJourney with _$CollaborativeJourney {
  @JsonSerializable(explicitToJson: true)
  const factory CollaborativeJourney(
    @JsonKey(name: 'memories') List<Memory> memories, {
    required String name,
    required List<String> authorizedUsers,
    required String ownerId,
    required String id,
  }) = _CollaborativeJourney;

  factory CollaborativeJourney.empty() => CollaborativeJourney(
        List.empty(growable: true),
        name: '',
        authorizedUsers: List.empty(growable: true),
        ownerId: '',
        id: '',
      );

  factory CollaborativeJourney.fromJson(Map<String, Object?> json) =>
      _$CollaborativeJourneyFromJson(json);
}
