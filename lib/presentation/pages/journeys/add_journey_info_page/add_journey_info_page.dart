import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/clickable/go_back_clickable_widget.dart';
import 'widgets/widgets.dart';

class AddJourneyInfoPage extends StatelessWidget {
  const AddJourneyInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * homePageHorizontalPadding,
          ),
          child: Column(
            children: [
              Divider(
                color: lightPrimaryColor,
                height: height * 0.05,
              ),
              const GoBackClickableWidget(),
              Divider(
                color: lightPrimaryColor,
                height: height * 0.025,
              ),
              const AddJourneyWidget(),
              Divider(
                color: lightPrimaryColor,
                height: height * 0.05,
              ),
              const AddCollaborativeJourneyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
