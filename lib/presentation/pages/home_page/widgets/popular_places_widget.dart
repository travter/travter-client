import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import 'popular_place_card_widget.dart';
import 'popular_section_text_widget.dart';

class PopularPlacesWidget extends StatelessWidget {
  const PopularPlacesWidget({required this.text, Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * homePageHorizontalPadding),
      child: Column(
        children: [
          PopularSectionTextWidget(text: text),
          Divider(
            height: height * 0.05,
            color: lightPrimaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  const [
              PopularPlaceCardWidget(),
              PopularPlaceCardWidget(),
            ],
          ),
          Divider(
            height: height * 0.025,
            color: lightPrimaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              PopularPlaceCardWidget(),
              PopularPlaceCardWidget(),
            ],
          )
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
