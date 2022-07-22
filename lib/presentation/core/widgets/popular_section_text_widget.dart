import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';
import '../extensions.dart';

class PopularSectionTextWidget extends StatelessWidget {
  const PopularSectionTextWidget({
    required this.text,
    this.redirectRoute,
    Key? key,
  }) : super(key: key);

  final String text;
  final PageRouteInfo? redirectRoute;

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
        if (redirectRoute != null)
          InkWell(
            onTap: () => context.router.push(redirectRoute!),
            child: const Text(
              'View all',
              style: TextStyle(
                color: lightBlueColor,
              ),
            ),
          )
        else
          Container(),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(
          DiagnosticsProperty<PageRouteInfo?>('redirectRoute', redirectRoute));
  }
}
