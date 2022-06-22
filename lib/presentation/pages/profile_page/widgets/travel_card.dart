import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';

class TravelCard extends StatelessWidget {
  const TravelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: lightPrimaryColor,
      ),
    );
  }
}
