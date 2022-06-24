import 'package:flutter/material.dart';

import '../../../../router/router.gr.dart';
import 'section_button_widget.dart';
import 'section_header_widget.dart';
import 'section_text_widget.dart';

class AddCollaborativeJourneyWidget extends StatelessWidget {
  const AddCollaborativeJourneyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SectionHeaderWidget("Don't let your memories die!"),
        SectionTextWidget(
          "Don't let your trip to be forgotten! Create a special "
          'chapter in your diary to save all excellent moments of your trip! All of your friends '
          'can edit it with you, so emotion will be excluded!',
        ),
        SectionButtonWidget(
          text: 'Start creating!',
          redirectRoute: AddCollaborativeJourneyRoute(),
        ),
      ],
    );
  }
}
