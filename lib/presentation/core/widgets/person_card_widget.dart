import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../router/router.gr.dart';
import '../constants/constant_colors.dart';
import '../extensions.dart';

class PersonCardWidget extends StatelessWidget {
  const PersonCardWidget(this._user, {Key? key}) : super(key: key);

  final User _user;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;
    return InkWell(
      onTap: () {
        context.router.push(PersonRoute(person: _user));
      },
      child: Container(
        width: width * 0.45,
        height: height * 0.2,
        decoration: BoxDecoration(
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Text(
          _user.firstName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
