import 'package:flutter/material.dart';

import '../../../../core/constants/constant_colors.dart';
import '../../../../core/extensions.dart';
import '../../../../core/widgets/bottom_navbar_widget.dart';
import '../../../home_page/widgets/popular_place_card_widget.dart';
import '../../load_navbar_children.dart';

class FavoritePlacesPage extends StatelessWidget {
  const FavoritePlacesPage({Key? key}) : super(key: key);

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
                child: Column(
                  children: [
                    for(var i = 0; i < 10; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: context.dims.height * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            PopularPlaceCardWidget(),
                            PopularPlaceCardWidget(),
                          ],
                        ),
                      ),
                  ],
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
