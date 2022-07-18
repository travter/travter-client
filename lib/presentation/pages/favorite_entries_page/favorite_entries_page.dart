import 'package:flutter/material.dart';
import 'package:traveler/presentation/pages/favorite_entries_page/widgets/favorite_posts_widget.dart';

import '../../core/constants/constant_colors.dart';
import '../../core/extensions.dart';
import '../../core/widgets/bottom_navbar_widget.dart';
import 'load_navbar_children.dart';

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
              constraints: BoxConstraints(
                maxHeight: height * 0.8,
                minHeight: height * 0.8,
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  Divider(
                    height: height * 0.05,
                    color: lightPrimaryColor,
                  ),
                  // const GoBackWidget(),
                  // const FavoritePlacesWidget(),
                  Divider(
                    height: height * 0.05,
                    color: lightPrimaryColor,
                  ),
                  const FavoritePostsWidget(),
                ]),
              ),
            ),
            BottomNavbarWidget(children: loadChildren(context)),
          ],
        ),
      ),
    );
  }
}
