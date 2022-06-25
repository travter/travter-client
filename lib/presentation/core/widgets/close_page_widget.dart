import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ClosePageWidget extends StatelessWidget {
  const ClosePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => context.router.pop(),
        child: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
