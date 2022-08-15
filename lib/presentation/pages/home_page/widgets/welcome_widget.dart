import 'package:flutter/material.dart';

import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import 'are_you_ready_text_widget.dart';
import 'hello_text_widget.dart';
import 'user_avatar_widget.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * homePageHorizontalPadding,
        vertical: height * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              HelloTextWidget(),
              UserAvatarWidget(
                radius: 20,
              ),
            ],
          ),
          const AreYouReadyTextWidget(),
        ],
      ),
    );
  }
}
