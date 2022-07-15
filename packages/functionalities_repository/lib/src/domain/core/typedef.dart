import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import 'execution_failure.dart';

typedef ImagesList = List<XFile>?;
typedef FunctionResult<T> = Either<ExecutionFailure, T>;