import 'package:dartz/dartz.dart';

import 'request_failure.dart';

typedef RequestResult<T> = Either<RequestFailure, T>;
