import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/expenses_tracker/expenses_tracker_form/expenses_tracker_form_bloc.dart';
import '../../../../core/constants/constant_colors.dart';

class SelectableFriendWidget extends StatelessWidget {
  const SelectableFriendWidget(this.user, {Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/brad_pitt.jpeg'),
              radius: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () => context.read<ExpensesTrackerFormBloc>().add(
                ExpensesTrackerFormEvent.togglePersonSelection(user.uid),
              ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context
                      .watch<ExpensesTrackerFormBloc>()
                      .state
                      .selectedUsers
                      .contains(user.uid)
                  ? lightGreenColor
                  : lightPrimaryColor,
              border: Border.all(color: Colors.white),
            ),
            width: 25,
            height: 25,
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<User>('user', user));
  }
}
