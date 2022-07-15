import 'package:dartz/dartz.dart';
import 'core/typedef.dart';

abstract class FunctionalitiesRepositoryInterface {
  Future<FunctionResult<ImagesPathsList>> selectAndSaveImages();
  Future<FunctionResult<Unit>> selectPeople();
}