import 'package:freezed_annotation/freezed_annotation.dart';

part 'edition_failure.freezed.dart';

@freezed
class EditionFailure with _$EditionFailure {
  const factory EditionFailure.incorrectData() = IncorrectData;
  const factory EditionFailure.failedToSaveImage() = FailedToSaveImage;
  const factory EditionFailure.unknownError() = UnknownError;
}