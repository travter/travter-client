import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/popular_section_text_widget.dart';
import '../../../router/router.gr.dart';
import 'popular_place_card_widget.dart';

class PopularPlacesWidget extends StatelessWidget {
  const PopularPlacesWidget({required this.text, Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * homePageHorizontalPadding,
      ),
      child: Column(
        children: [
          PopularSectionTextWidget(
            text: text,
          ),
          Divider(
            height: height * 0.05,
            color: lightPrimaryColor,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                PopularPlaceCardWidget(),
                PopularPlaceCardWidget(),
                PopularPlaceCardWidget(),
                PopularPlaceCardWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text));
  }
}
