import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../domain/core/execution_failure.dart';
import '../domain/core/typedef.dart';
import '../domain/functionalities_repository_interface.dart';

class FunctionalitiesRepository implements FunctionalitiesRepositoryInterface{
  @override
  Future<Either<ExecutionFailure, ImagesList>> selectImages() async {
    final picker = ImagePicker();

     final images = await picker.pickMultiImage();

     return right(images);
  }

  @override
  Future<Either<ExecutionFailure, Unit>> selectPeople() {
    // TODO: implement selectPeople
    throw UnimplementedError();
  }

}