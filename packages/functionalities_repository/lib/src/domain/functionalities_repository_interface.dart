import 'package:dartz/dartz.dart';
import 'core/typedef.dart';

abstract class FunctionalitiesRepositoryInterface {
  Future<FunctionResult<ImagesPathsList>> selectAndSaveImages(
      {bool multiple = true});
  Future<FunctionResult<Unit>> selectPeople();
}
