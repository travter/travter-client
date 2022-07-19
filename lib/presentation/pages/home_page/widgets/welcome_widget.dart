import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/user/user_bloc.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * homePageHorizontalPadding,
        vertical: height * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Hello, ',
                    style: TextStyle(
                      color: lightBlueColor,
                      letterSpacing: 0.5,
                      fontSize: 20,
                    ),
                  ),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      return Text(
                        state.user.username,
                        style: const TextStyle(
                          color: Colors.white,
                          letterSpacing: 0.5,
                          fontSize: 20,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const CircleAvatar(
                radius: 15,
                backgroundImage:
                AssetImage('assets/images/profile_picture.jpeg'),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.01),
            child: Text(
              'Are you ready to explore?',
              style: TextStyle(
                color: Colors.white.withOpacity(0.85),
                fontStyle: FontStyle.italic,
              ),
            ),
          )
        ],
      ),
    );
  }
}
