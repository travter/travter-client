import 'package:flutter/material.dart';

import '../../../core/extensions.dart';

class AreYouReadyTextWidget extends StatelessWidget {
  const AreYouReadyTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(top: height * 0.01),
      child: Text(
        'Are you ready to explore?',
        style: TextStyle(
          color: Colors.white.withOpacity(0.85),
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
