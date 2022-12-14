import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constant_colors.dart';
import '../../../../../router/router.gr.dart';

class ContinueButtonWidget extends StatelessWidget {
  const ContinueButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: InkWell(
        onTap: () => context.router.popAndPush(const ImageAndBioRoute()),
        child: Container(
          decoration: BoxDecoration(
            color: middleBlueGreenColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 50,
            ),
            child: Text('Continue'),
          ),
        ),
      ),
    );
  }
}
