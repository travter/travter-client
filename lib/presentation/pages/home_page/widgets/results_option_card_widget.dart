import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/extensions.dart';

class ResultsOptionCardWidget extends StatelessWidget {
  const ResultsOptionCardWidget({
    required this.text,
    required this.iconData,
    Key? key,
  }) : super(key: key);

  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(2, 1),
          ),
        ],
        color: primaryColor,
      ),
      width: width * 0.425,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.02, horizontal: width * 0.05),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.white.withOpacity(0.9),
              size: 20,
            ),
            Expanded(
              child: Align(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(DiagnosticsProperty<IconData>('iconData', iconData));
  }
}
