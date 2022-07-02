import 'package:flutter/material.dart';

import '../../../../core/constants/constant_colors.dart';
import '../../../../core/extensions.dart';
import '../../../../core/widgets/bottom_navbar_widget.dart';
import '../../../../core/widgets/travel_card.dart';
import '../../load_navbar_children.dart';

class FavoritePostsPage extends StatelessWidget {
  const FavoritePostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Column(
          children: [
             Container(
                height: context.dims.height * 0.8,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: context.dims.height * 0.05),
                    child: Column(
                      children: const [
                      ],
                ),
                  ),
              ),
            ),
            BottomNavbarWidget(children: loadChildren(context)),
          ],
        ),
      ),
    );
  }
}
