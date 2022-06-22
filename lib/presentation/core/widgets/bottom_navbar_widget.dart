import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../router/router.gr.dart';
import '../constants/constant_colors.dart';
import '../extensions.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({Key? key}) : super(key: key);

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
            children: [
              InkWell(
                  onTap: () => context.router.push(const SearchRoute()),
                  child: const Icon(Icons.search, color: Colors.white)),
              InkWell(
                onTap: () => context.router.push(const AddJourneyRoute()),
                child:
                    const Icon(Icons.add_circle_outline, color: Colors.white),
              ),
              InkWell(
                onTap: () => context.router.push(const CalculationsRoute()),
                child:
                    const Icon(Icons.calculate_outlined, color: Colors.white),
              ),
              InkWell(
                onTap: () => context.router.push(
                  const ProfileRoute(),
                ),
                child: const Icon(Icons.account_circle, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
