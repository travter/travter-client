import 'package:flutter/material.dart';

import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import 'popular_section_text_widget.dart';

class PopularPeoplesWidget extends StatelessWidget {
  const PopularPeoplesWidget({Key? key}) : super(key: key);

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
        children: const [
          PopularSectionTextWidget(text: 'Popular People'),
        ],
      ),
    );
  }
}
