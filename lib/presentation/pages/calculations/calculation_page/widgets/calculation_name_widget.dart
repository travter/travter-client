import 'package:flutter/material.dart';

import '../../../../core/constants/constant_colors.dart';

class CalculationNameWidget extends StatelessWidget {
  const CalculationNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: lightBlueColor,
            width: 1.5,
          ),
        ),
      ),
      child: const Text(
        'US Trip',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
