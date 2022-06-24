import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/go_back_widget.dart';
import '../add_journey_page/widgets/widgets.dart';
import 'widgets/upload_photos_widget.dart';

class AddJourneyPage extends StatelessWidget {
  const AddJourneyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

    return Scaffold(
      backgroundColor: lightPrimaryColor,
      body: Padding(
        padding: EdgeInsets.only(top: height *  0.05),
        child: Column(
          children: const [
            GoBackWidget(),
            AddJourneyFormWidget(),
            AddPeopleWidget(),
            UploadPhotosWidget(),
            AddJourneyButtonWidget(),
          ],
        ),
      ),
    );
  }
}

