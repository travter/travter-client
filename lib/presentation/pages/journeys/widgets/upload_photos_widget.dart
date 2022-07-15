import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:functionalities_repository/functionalities_repository.dart';

import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';

class UploadPhotosWidget extends StatelessWidget {
  const UploadPhotosWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return InkWell(
      onTap: () async {
        final imagesPaths = await context.read<FunctionalitiesRepository>()
            .selectAndSaveImages();

        await imagesPaths.fold((l){
         print("errorinio");
        }, (imagesPaths) async {
          if(imagesPaths == null) {
            return;
          }
          await context.read<DataRepository>().saveImagesToStorage(imagesPaths);
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * homePageHorizontalPadding,
          vertical: height * 0.025,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.photo,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.015,
              ),
              child: const Text(
                'Upload photos',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
