import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/popular_section_text_widget.dart';
import '../../../core/widgets/travel_card.dart';
import '../../../router/router.gr.dart';

class FavoritePostsWidget extends StatelessWidget {
  const FavoritePostsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * homePageHorizontalPadding,
      ),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PopularSectionTextWidget(
              text: 'Favorite Posts',
              redirectRoute: FavoritePostsRoute(),
            ),
            TravelCard(),
            TravelCard(),
          ],
        ),
      ),
    );
  }
}
