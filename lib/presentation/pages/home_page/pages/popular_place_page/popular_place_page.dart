import 'package:flutter/material.dart';

import '../../../../core/constants/constant_colors.dart';
import '../../../../core/widgets/journey_image_widget.dart';
import 'widgets/place_info_widget.dart';

class PopularPlacePage extends StatelessWidget {
  const PopularPlacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: SingleChildScrollView(
          child: Stack(
            children: const [
              JourneyImageWidget(),
              PlaceInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
