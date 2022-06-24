import 'package:flutter/material.dart';

import '../../../../core/constants/constant_colors.dart';

class PopularPlacesPage extends StatelessWidget {
  const PopularPlacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Text('Popular Places'),
      ),
    );
  }
}
