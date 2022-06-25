import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/bottom_navbar_widget.dart';
import '../../../core/widgets/go_back_widget.dart';
import '../../../router/router.gr.dart';
import 'widgets/calculation_card_widget.dart';

class CalculationsPage extends StatelessWidget {
  const CalculationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.05,
                  bottom: height * 0.05,
                  left: width * homePageHorizontalPadding,
              ),
              child: const GoBackWidget(),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height * 0.725),
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
            BottomNavbarWidget(
              isSearchNeeded: false,
              children: _loadChildren(context),
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