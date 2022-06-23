import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';
import '../extensions.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({required this.children, Key? key}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(-1, 0),
              ),
            ],
            color: darkPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: height * 0.0225),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children,
          ),
        ),
      ),
    );
  }
}
