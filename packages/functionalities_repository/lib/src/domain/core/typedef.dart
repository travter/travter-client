import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import 'execution_failure.dart';

typedef ImagesPathsList = List<String>?;
typedef FunctionResult<T> = Either<ExecutionFailure, T>;