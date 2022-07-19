import 'package:dartz/dartz.dart';

import 'execution_failure.dart';

typedef ImagesPathsList = List<String>?;
typedef FunctionResult<T> = Either<ExecutionFailure, T>;
