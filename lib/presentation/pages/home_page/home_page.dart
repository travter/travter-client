import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constant_colors.dart';
import '../../core/extensions.dart';
import '../../core/widgets/bottom_navbar_widget.dart';
import '../../router/router.gr.dart';
import 'widgets/popular_peoples_widget.dart';
import 'widgets/welcome_widget.dart';
import 'widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height * 0.85),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const WelcomeWidget(),
                    const ResultsOptionsWidget(),
                    Divider(
                      height: height * 0.05,
                      color: lightPrimaryColor,
                    ),
                    const PopularPlacesWidget(),
                    const PopularPeoplesWidget(),
                  ]
                ),
              ),
            ),
            BottomNavbarWidget(children: _loadChildren(context)),
          ],
        ),
      ),
    );
  }
}

List<Widget> _loadChildren(BuildContext context) {
  final _children = [
    InkWell(
        onTap: () => context.router.push(const SearchRoute()),
        child: const Icon(Icons.search, color: Colors.white)),
    InkWell(
      onTap: () => context.router.push(const AddJourneyRoute()),
      child: const Icon(Icons.add_circle_outline, color: Colors.white),
    ),
    InkWell(
      onTap: () => context.router.push(const CalculationsRoute()),
      child: const Icon(Icons.calculate_outlined, color: Colors.white),
    ),
    InkWell(
      onTap: () => context.router.push(
        const ProfileRoute(),
      ),
      child: const Icon(Icons.account_circle, color: Colors.white),
    ),
  ];

  return _children;
}
