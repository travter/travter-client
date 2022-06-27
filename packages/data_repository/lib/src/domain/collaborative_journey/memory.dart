import 'package:freezed_annotation/freezed_annotation.dart';

part 'memory.freezed.dart';

part 'memory.g.dart';

@freezed
class Memory with _$Memory {
  const factory Memory({
    required String name,
    required String description,
    required List<String> photos,
  }) = _Memory;

  factory Memory.empty() => Memory(
        name: '',
        description: '',
        photos: List.empty(growable: true),
      );

  factory Memory.fromJson(Map<String, Object?> json) => _$MemoryFromJson(json);
}
