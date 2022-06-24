import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constant_colors.dart';
import '../../../../core/extensions.dart';

class SectionButtonWidget extends StatelessWidget {
  const SectionButtonWidget({
    required this.text,
    required this.redirectRoute,
    Key? key,
  }) : super(key: key);

  final String text;
  final PageRouteInfo redirectRoute;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(top: height * 0.05),
      child: Align(
        child: InkWell(
          onTap: () => context.router.push(redirectRoute),
          child: Container(
            alignment: Alignment.center,
            width: width * 0.6,
            padding: EdgeInsets.symmetric(
              vertical: height * 0.015,
            ),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                )
              ]
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(DiagnosticsProperty<PageRouteInfo>('redirectRoute', redirectRoute));
  }
}
