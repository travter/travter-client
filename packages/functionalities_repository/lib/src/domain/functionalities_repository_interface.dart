import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import 'core/execution_failure.dart';
import 'core/typedef.dart';

abstract class FunctionalitiesRepositoryInterface {
  Future<FunctionResult<ImagesList>> selectImages();
  Future<FunctionResult<Unit>> selectPeople();
}