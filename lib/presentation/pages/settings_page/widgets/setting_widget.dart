import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/authentication/authentication_bloc.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/extensions.dart';
import '../../../router/router.gr.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({
    required this.icon,
    required this.text,
    required this.redirectRoute,
    bool? logout,
    Key? key,
  })  : _logout = logout ?? false,
        super(key: key);

  final IconData icon;
  final String text;
  final PageRouteInfo redirectRoute;
  final bool _logout;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.01),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.025,
          vertical: height * 0.0225,
        ),
        decoration: BoxDecoration(
          color: lightPrimaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: width * 0.025),
              child: Icon(
                icon,
                color: _logout ? Colors.red : Colors.white.withOpacity(0.9),
                size: 18,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: _logout ? Colors.red : Colors.white.withOpacity(0.9),
                fontSize: 13,
                letterSpacing: 0.5,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    if (_logout) {
                      context.read<AuthenticationBloc>().add(
                            const AuthenticationEvent.signedOut(),
                          );
                      context.router.popAndPush(
                        const LoginRoute(),
                      );
                      return;
                    }
                    context.router.push(redirectRoute);
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white.withOpacity(0.9),
                    size: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<PageRouteInfo>('redirectRoute', redirectRoute))
      ..add(StringProperty('text', text))
      ..add(DiagnosticsProperty<IconData>('icon', icon))
      ..add(DiagnosticsProperty<bool?>('logout', _logout));
  }
}
