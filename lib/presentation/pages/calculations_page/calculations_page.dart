import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constant_colors.dart';
import '../../core/extensions.dart';
import '../../core/widgets/bottom_navbar_widget.dart';
import '../../router/router.gr.dart';
import 'widgets/calculation_card_widget.dart';

class CalculationsPage extends StatelessWidget {
  const CalculationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return Scaffold(
      backgroundColor: lightPrimaryColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.05),
            child: const _GoBackWidget(),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: height * 0.75),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  CalculationCardWidget(),
                  CalculationCardWidget(),
                  CalculationCardWidget(),
                  CalculationCardWidget(),
                  CalculationCardWidget(),
                ],
              ),
            ),
          ),
          BottomNavbarWidget(children: _loadChildren(context)),
        ],
      ),
    );
  }
}

class _GoBackWidget extends StatelessWidget {
  const _GoBackWidget({Key? key}) : super(key: key);

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

List<Widget> _loadChildren(BuildContext context) {
  final _children = [
    InkWell(
      onTap: () => context.router.push(const AddCalculationRoute()),
      child: const Icon(Icons.add_circle_outline, color: Colors.white),
    ),
  ];

  return _children;
}
