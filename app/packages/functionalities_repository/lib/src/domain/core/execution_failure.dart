import 'package:freezed_annotation/freezed_annotation.dart';

part 'execution_failure.freezed.dart';

@freezed
class ExecutionFailure {
  const factory ExecutionFailure.serverError() = ServerError;
  const factory ExecutionFailure.abortedByUser() = AbortedByUser;
}
