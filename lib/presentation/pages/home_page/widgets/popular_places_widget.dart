import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import 'popular_place_card_widget.dart';

class PopularPlacesWidget extends StatelessWidget {
  const PopularPlacesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * homePageHorizontalPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Popular Places',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'View all',
                style: TextStyle(
                  color: lightBlueColor,
                ),
              ),
            ],
          ),
          Divider(
            height: height * 0.05,
            color: lightPrimaryColor,
          ),
          const PopularPlaceCardWidget(),
        ],
      ),
    );
  }
}
