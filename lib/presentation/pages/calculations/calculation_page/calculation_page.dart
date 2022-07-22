import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/expenses_tracker/expenses_tracker_bloc.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/clickable/go_back_clickable_widget.dart';
import 'widgets/calculation_name_widget.dart';
import 'widgets/expense_card_widget.dart';

class CalculationPage extends StatelessWidget {
  const CalculationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: BlocBuilder<ExpensesTrackerBloc, ExpensesTrackerState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * homePageHorizontalPadding,
                  vertical: height * 0.05,
                ),
                child: Column(
                  children: [
                    const GoBackClickableWidget(),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CalculationNameWidget(),
                        Icon(Icons.more_vert, color: Colors.white),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    for (final expense
                        in state.currentlyLookedUpTracker!.expenses)
                      ExpenseCardWidget(
                        expense: expense,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
