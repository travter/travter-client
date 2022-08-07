import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/user/user_bloc.dart';
import '../../../core/constants/constant_colors.dart';

class HelloTextWidget extends StatelessWidget {
  const HelloTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
