import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/journey/journey_form/journey_form_bloc.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';

class UploadPhotosWidget extends StatelessWidget {
  const UploadPhotosWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return InkWell(
      onTap: () => context
          .read<JourneyFormBloc>()
          .add(const JourneyFormEvent.uploadPhotosStarted()),
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
