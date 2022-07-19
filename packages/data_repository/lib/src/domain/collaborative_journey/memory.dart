import 'package:freezed_annotation/freezed_annotation.dart';

part 'memory.freezed.dart';

part 'memory.g.dart';

@freezed
class Memory with _$Memory {
  const factory Memory({
    required String name,
    required String description,
    required List<String> photos,
    required String ownerId,
    required String id,
  }) = _Memory;

  factory Memory.empty() => Memory(
        name: '',
        description: '',
        photos: List.empty(growable: true),
        ownerId: '',
        id: '',
      );

  factory Memory.fromJson(Map<String, Object?> json) => _$MemoryFromJson(json);
}
