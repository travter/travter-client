import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ClosePageClickableWidget extends StatelessWidget {
  const ClosePageClickableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pop(),
      child: const Align(
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
