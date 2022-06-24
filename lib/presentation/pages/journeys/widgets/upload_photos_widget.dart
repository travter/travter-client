import 'package:flutter/material.dart';

import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';

class UploadPhotosWidget extends StatelessWidget {
  const UploadPhotosWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
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
    );
  }
}
