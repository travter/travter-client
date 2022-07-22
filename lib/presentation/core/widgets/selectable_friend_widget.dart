import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/collaborative_journey/collaborative_journey_form/collaborative_journey_form_bloc.dart';
import '../../../application/expenses_tracker/expenses_tracker_form/expenses_tracker_form_bloc.dart';
import '../../../infrastructure/core/constants/enums.dart';
import '../constants/constant_colors.dart';

class SelectableFriendWidget extends StatelessWidget {
  const SelectableFriendWidget(this.user, {required this.entryType, Key? key})
      : super(key: key);

  final User user;
  final CollaborativeEntryType entryType;

  @override
  Widget build(BuildContext context) {
    Color getRadioColor() {
      if (entryType == CollaborativeEntryType.tracker) {
        return context
                .watch<ExpensesTrackerFormBloc>()
                .state
                .selectedUsers
                .contains(user.uid)
            ? lightGreenColor
            : lightPrimaryColor;
      } else {
        return context
                .watch<CollaborativeJourneyFormBloc>()
                .state
                .selectedUsers
                .contains(user.uid)
            ? lightGreenColor
            : lightPrimaryColor;
      }
    }

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
          onTap: () => entryType == CollaborativeEntryType.tracker
              ? context.read<ExpensesTrackerFormBloc>().add(
                    ExpensesTrackerFormEvent.togglePersonSelection(user.uid),
                  )
              : context.read<CollaborativeJourneyFormBloc>().add(
                    CollaborativeJourneyFormEvent.togglePersonSelection(
                        user.uid),
                  ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getRadioColor(),
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
