import 'package:flutter/material.dart';

import '../../../../core/extensions.dart';
import '../../../../router/router.gr.dart';
import 'section_button_widget.dart';
import 'section_header_widget.dart';
import 'section_text_widget.dart';

class AddJourneyWidget extends StatelessWidget {
  const AddJourneyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionHeaderWidget('Add Journey'),
          SectionTextWidget(
            'You can tell about the places you have visited and emotions you experienced and share it to the world!/n Do not forget to show off the photos!',
          ),
          SectionButtonWidget(
            text: 'Describe your trip!',
            redirectRoute: AddJourneyRoute(),
          )
        ],
      ),
    );
  }
}
