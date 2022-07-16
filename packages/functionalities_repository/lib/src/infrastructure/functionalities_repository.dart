import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../domain/core/execution_failure.dart';
import '../domain/core/typedef.dart';
import '../domain/functionalities_repository_interface.dart';

class FunctionalitiesRepository implements FunctionalitiesRepositoryInterface {
  @override
  Future<FunctionResult<ImagesPathsList>> selectAndSaveImages({bool multiple = true}) async {

    final picker = ImagePicker();

    List<XFile>? images = [];

    if(!multiple) {
      final _image = await picker.pickImage(source: ImageSource.gallery);
      if(_image == null) {
        return left(const ExecutionFailure.abortedByUser());
      }
      images.add(_image);
    } else {
      images = await picker.pickMultiImage();
      if (images == null) {
        return left(const ExecutionFailure.abortedByUser());
      }
    }

    final _dir = await getApplicationDocumentsDirectory();
    final path = _dir.path;
    final imagesPathsList = <String>[];
    for (final image in images) {
      final fullPath = '$path/${image.name}';
      await image.saveTo(fullPath);
      imagesPathsList.add(fullPath);
    }

    return right(imagesPathsList);
  }

  @override
  Future<FunctionResult<Unit>> selectPeople() {
    // TODO: implement selectPeople
    throw UnimplementedError();
  }
}
