import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';

class LackOfNewPostsWidget extends StatelessWidget {
  const LackOfNewPostsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'There is nothing new to see... Add your own journey!',
      style: TextStyle(
        color: middleBlueGreenColor,
        fontWeight: FontWeight.bold
      ),
      textAlign: TextAlign.center,
    );
  }
}
