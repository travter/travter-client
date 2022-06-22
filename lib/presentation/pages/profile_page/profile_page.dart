import 'package:flutter/material.dart';

import '../../core/constants/constant_colors.dart';
import 'widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            NickTextWidget(),
            ProfileSummary(),
            TravelCard(),
           ]
        ),
      ),
    );
  }
}
