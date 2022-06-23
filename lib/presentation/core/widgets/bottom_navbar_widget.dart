import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';
import '../extensions.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({required this.children, Key? key})
      : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                ),
                child: Container(
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    color: const Color(0xff303030),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      focusedBorder: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: children,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
