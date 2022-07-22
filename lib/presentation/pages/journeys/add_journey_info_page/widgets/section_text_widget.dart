import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions.dart';

class SectionTextWidget extends StatelessWidget {
  const SectionTextWidget(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return Text(
      text,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 13.5,
        letterSpacing: 0.5,
        height: height * 0.0025,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text));
  }
}
