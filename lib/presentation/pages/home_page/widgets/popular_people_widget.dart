import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/popular_section_text_widget.dart';
import 'popular_person_card_widget.dart';

class PopularPeopleWidget extends StatelessWidget {
  const PopularPeopleWidget({Key? key}) : super(key: key);

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
        children: [
          const PopularSectionTextWidget(
            text: 'Popular People',
          ),
          Divider(
            height: height * 0.05,
            color: lightPrimaryColor,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                PopularPersonCardWidget(),
                PopularPersonCardWidget(),
                PopularPersonCardWidget(),
                PopularPersonCardWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
