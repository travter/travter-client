import 'package:flutter/material.dart';

import '../../core/constants/constant_colors.dart';
import '../../core/constants/constant_dimensions.dart';
import '../../core/extensions.dart';
import '../../core/widgets/bottom_navbar_widget.dart';
import '../../core/widgets/clickable/go_back_clickable_widget.dart';
import 'load_navbar_children.dart';
import 'widgets/favorite_posts_widget.dart';

class FavoriteEntriesPage extends StatelessWidget {
  const FavoriteEntriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.dims.width * homePageHorizontalPadding),
          child: Column(
            children: [
              SizedBox(height:10),
              GoBackClickableWidget(),
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
              // BottomNavbarWidget(children: loadChildren(context)),
            ],
          ),
        ),
      ),
    );
  }
}
