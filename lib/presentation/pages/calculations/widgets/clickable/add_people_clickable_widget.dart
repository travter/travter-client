import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/expenses_tracker/expenses_tracker_form/expenses_tracker_form_bloc.dart';
import '../../../../core/extensions.dart';

class AddPeopleClickableWidget extends StatelessWidget {
  const AddPeopleClickableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.dims.width;

    return InkWell(
      onTap: () => context.read<ExpensesTrackerFormBloc>().add(
        const ExpensesTrackerFormEvent.addPeopleStarted(),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.add_circle_outline,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.015,
            ),
            child: const Text(
              'Add people to this expenses tracker',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}