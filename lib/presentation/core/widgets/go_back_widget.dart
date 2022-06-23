import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../extensions.dart';

class GoBackWidget extends StatelessWidget {
  const GoBackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    return InkWell(
      onTap: () => context.router.pop(),
      child: Container(
        // width: width * (1 / 3),
        padding: EdgeInsets.only(left: width * 0.025),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white.withOpacity(0.9),
            ),
            const Text(
              'Back',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
