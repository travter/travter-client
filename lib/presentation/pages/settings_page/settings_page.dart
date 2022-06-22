import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constant_colors.dart';
import '../../core/extensions.dart';
import '../../router/router.gr.dart';
import 'widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.035,
          vertical: height * 0.05,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                  InkWell(
                    onTap: () => context.router.pop(),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SettingWidget(
              icon: Icons.account_circle,
              text: 'Edit Profile',
              redirectRoute: EditProfileRoute(),
            ),
            const SettingWidget(
              icon: Icons.privacy_tip_outlined,
              text: 'Privacy Policy',
              redirectRoute: EditProfileRoute(),
            ),
            const SettingWidget(
              icon: Icons.security_rounded,
              text: 'Terms of service',
              redirectRoute: EditProfileRoute(),
            ),
            const SettingWidget(
              icon: Icons.people_outline,
              text: 'Community Guidelines',
              redirectRoute: EditProfileRoute(),
            ),
            const SettingWidget(
              icon: Icons.logout,
              text: 'Log out',
              redirectRoute: EditProfileRoute(),
              logout: true,
            ),
          ],
        ),
      ),
    );
  }
}
