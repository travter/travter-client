import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/authentication/authentication_bloc.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/extensions.dart';

class PersonProfileSummary extends StatelessWidget {
  const PersonProfileSummary(this._user, {Key? key}) : super(key: key);

  final User _user;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return  Container(
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
                  child: Text(
                    '${_user.firstName} ${_user.lastName}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Text(
                    _user.bio,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      wordSpacing: 2,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  height: height * 0.015,
                  color: lightPrimaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_user.following.length} following',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.025),
                      child: Text(
                        '${_user.followers.length} followers',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}
