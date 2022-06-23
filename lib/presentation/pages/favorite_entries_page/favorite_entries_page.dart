import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constant_colors.dart';
import '../../core/extensions.dart';
import '../../core/widgets/bottom_navbar_widget.dart';
import '../../router/router.gr.dart';
import '../home_page/widgets/feed_section_widget.dart';
import '../home_page/widgets/popular_people_widget.dart';
import '../home_page/widgets/popular_places_widget.dart';

class FavoriteEntriesPage extends StatelessWidget {
  const FavoriteEntriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height * 0.8),
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      const PopularPlacesWidget(),
                      Divider(
                       height: height * 0.05,
                        color: lightPrimaryColor,
                      ),
                      const FeedSectionWidget(),
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
      onTap: () => context.router.push(const AddJourneyRoute()),
      child: const Icon(Icons.add_circle_outline, color: Colors.white),
    ),
    InkWell(
      onTap: () => context.router.push(const CalculationsRoute()),
      child: const Icon(Icons.calculate_outlined, color: Colors.white),
    ),
    InkWell(
      onTap: () => context.router.push(
        const FavoriteEntriesRoute(),
      ),
      child: const Icon(Icons.favorite_border, color: Colors.white),
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

