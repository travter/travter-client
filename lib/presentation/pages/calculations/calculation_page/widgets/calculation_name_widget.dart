import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/expenses_tracker/expenses_tracker_bloc.dart';
import '../../../../core/constants/constant_colors.dart';

class CalculationNameWidget extends StatelessWidget {
  const CalculationNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: lightBlueColor,
            width: 1.5,
          ),
        ),
      ),
      child: Text(
        context.read<ExpensesTrackerBloc>().state.currentlyLookedUpTracker!.name,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
