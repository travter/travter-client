import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constant_colors.dart';
import '../../../../core/extensions.dart';

class SectionHeaderTextWidget extends StatelessWidget {
  const SectionHeaderTextWidget(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.015),
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: lightBlueColor,
            width: 2,
          ),
        )),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text));
  }
}
