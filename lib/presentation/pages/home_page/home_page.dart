import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/bottom_navbar_widget.dart';
import '../../router/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
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
