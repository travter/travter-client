import 'package:dartz/dartz.dart';

import '../core/value_failures.dart';
import '../core/value_objects.dart';
import '../core/value_validators.dart';

class Username extends ValueObject<String> {
  factory Username(String input) {
    return Username._(
      validateUsername(input),
    );
  }

  const Username._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}
