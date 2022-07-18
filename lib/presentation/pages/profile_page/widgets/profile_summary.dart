import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/authentication/authentication_bloc.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/extensions.dart';

class ProfileSummary extends StatelessWidget {
  const ProfileSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
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
                  child: Text(
                    '${state.user.firstName} ${state.user.lastName}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Text(
                    state.user.bio,
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
                      '${state.user.following.length} following',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.025),
                      child: Text(
                        '${state.user.followers.length} followers',
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
      },
    );
  }
}
