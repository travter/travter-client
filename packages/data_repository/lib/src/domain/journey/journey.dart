import 'package:freezed_annotation/freezed_annotation.dart';

part 'journey.freezed.dart';
part 'journey.g.dart';

@freezed
class Journey with _$Journey {
  const factory Journey({
    required String name,
    required List<String> visitedPlaces,
    required String description,
    required List<String> photos,
  }) = _Journey;

  factory Journey.empty() => Journey(
        name: '',
        visitedPlaces: List.empty(growable: true),
        description: '',
        photos: List.empty(growable: true),
      );

  factory Journey.fromJson(Map<String, Object?> json) =>
      _$JourneyFromJson(json);
}
