import 'package:flutter/material.dart';

import '../../../../core/constants/constant_colors.dart';
import '../../../../core/extensions.dart';

class VisitedPlacesWidget extends StatelessWidget {
  const VisitedPlacesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

    return Padding(
      padding: EdgeInsets.only(top: height * 0.025),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.025,
          horizontal: width * 0.05,
        ),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: const [
            _VisitedPlaceWidget('Warsaw'),
            _VisitedPlaceWidget('Uzbekistan'),
            _VisitedPlaceWidget('Havana'),
            _VisitedPlaceWidget('Oslo'),
            _VisitedPlaceWidget('Moscow'),
          ]),
        ),
      ),
    );
  }
}

class _VisitedPlaceWidget extends StatelessWidget {
  const _VisitedPlaceWidget(this._text, {Key? key}) : super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.015),
      child: Row(
        children: [
          const Icon(
            Icons.place,
            color: Colors.red,
            size: 15,
          ),
          Text(
            _text,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
