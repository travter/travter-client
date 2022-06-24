import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:traveler/presentation/pages/favorite_entries_page/widgets/favorite_posts_widget.dart';

import '../../core/constants/constant_colors.dart';
import '../../core/extensions.dart';
import '../../core/widgets/bottom_navbar_widget.dart';
import '../../core/widgets/go_back_widget.dart';
import '../../router/router.gr.dart';
import '../home_page/widgets/feed_section_widget.dart';
import '../home_page/widgets/popular_people_widget.dart';
import '../home_page/widgets/popular_places_widget.dart';
import 'widgets/favorite_places_widget.dart';

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
                      Divider(
                        height: height * 0.05,
                        color: lightPrimaryColor,
                      ),
                      // const GoBackWidget(),
                      const FavoritePlacesWidget(),
                      Divider(
                       height: height * 0.05,
                        color: lightPrimaryColor,
                      ),
                      const FavoritePostsWidget(),
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

class _FavoritePlacesWidget extends StatelessWidget {
  const _FavoritePlacesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


List<Widget> _loadChildren(BuildContext context) {
  final _children = [
    InkWell(
      onTap: () => context.router.push(const HomeRoute()),
      child: const Icon(Icons.home, color: Colors.white),
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

