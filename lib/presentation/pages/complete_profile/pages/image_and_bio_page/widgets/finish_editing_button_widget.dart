import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../application/edit_profile/edit_profile_bloc.dart';
import '../../../../../../application/user/user_bloc.dart';
import '../../../../../core/constants/constant_colors.dart';
import '../../../../../router/router.gr.dart';

class FinishEditingButtonWidget extends StatelessWidget {
  const FinishEditingButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: InkWell(
        onTap: () {
          context.router.popAndPush(const HomeRoute());
          context.read<EditProfileBloc>().add(const SubmitFormPressed());
          final currentEditState = context.read<EditProfileBloc>().state;
          final currentUserState = context.read<UserBloc>().state.user;

          final editedUser = User.fromEdited(
            currentUserState,
            currentEditState.username,
            currentEditState.bio,
            currentEditState.firstName,
            currentEditState.lastName,
          );

          context.read<UserBloc>().add(UserEvent.userStateUpdated(editedUser));
        },
        child: Container(
          decoration: BoxDecoration(
            color: middleBlueGreenColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 50,
            ),
            child: Text('Finish'),
          ),
        ),
      ),
    );
  }
}
