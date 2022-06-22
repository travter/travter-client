import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/extensions.dart';

class ProfileSummary extends StatelessWidget {
  const ProfileSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: lightPrimaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.04,
          horizontal: width * 0.075,
        ),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  'assets/images/profile_picture.jpeg',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.01),
              child: const Text(
                'Wiktor Zając',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.02),
              child: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ac mi vitae turpis maximus consequat sit amet et libero. In sollicitudin, elit eu pretium egestas, mauris dui aliquet ante, et dignissim nisi enim vitae tellus. ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  wordSpacing: 2,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
