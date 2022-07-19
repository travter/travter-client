import 'package:flutter/material.dart';

import '../../../core/extensions.dart';

class LogoIcon extends StatelessWidget {
  const LogoIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.dims.height * 0.1,
      ),
      child: Container(
        height: context.dims.height * 0.1,
        child: Image.asset(
          'assets/icons/travel-icon.png',
        ),
      ),
    );
  }
}
