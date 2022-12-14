import 'package:flutter/material.dart';

import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import 'results_option_card_widget.dart';

class ResultsOptionsWidget extends StatelessWidget {
  const ResultsOptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * homePageHorizontalPadding),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ResultsOptionCardWidget(
                iconData: Icons.people_outline, text: 'People'),
            ResultsOptionCardWidget(iconData: Icons.public, text: 'Places'),
          ],
        ),
      ),
    );
  }
}
