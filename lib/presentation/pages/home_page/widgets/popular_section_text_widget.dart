import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/extensions.dart';

class PopularSectionTextWidget extends StatelessWidget {
  const PopularSectionTextWidget({required this.text, Key? key})
      : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: lightBlueColor,
                width: width * 0.005,
              ),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const Text(
          'View all',
          style: TextStyle(
            color: lightBlueColor,
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text));
  }
}
