import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class GoBackClickableWidget extends StatelessWidget {
  const GoBackClickableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pop(),
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
    );
  }
}
