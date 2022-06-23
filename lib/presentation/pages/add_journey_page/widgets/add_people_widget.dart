import 'package:flutter/material.dart';

import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';

class AddPeopleWidget extends StatelessWidget {
  const AddPeopleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * homePageHorizontalPadding,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.add_circle_outline,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.015,
            ),
            child: const Text(
              'Add people to your journey',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
