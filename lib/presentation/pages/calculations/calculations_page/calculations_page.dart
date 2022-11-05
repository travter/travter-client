import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackers/trackers.dart';

import '../../../../application/expenses_tracker/expenses_tracker_bloc.dart';
import '../../../../application/user/user_bloc.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/bottom_navbar_widget.dart';
import '../../../core/widgets/clickable/go_back_clickable_widget.dart';
import '../../../router/router.gr.dart';
import 'widgets/calculation_card_widget.dart';

class CalculationsPage extends StatelessWidget {
  const CalculationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: BlocBuilder<ExpensesTrackerBloc, ExpensesTrackerState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.05,
                    bottom: height * 0.05,
                    left: width * homePageHorizontalPadding,
                  ),
                  child: const GoBackClickableWidget(),
                ),
                InkWell(
                  onTap: () {
                   TrackersRepository().getTracker(1);
                  },
                  child: const Text(
                    'GRPC TEST ES',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: height * 0.7,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.015,
                        left: width * 0.015,
                        right: width * 0.015,
                      ),
                      child: Column(
                        children: [
                          for (final tracker in state.trackers)
                            CalculationCardWidget(
                              tracker: tracker,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                BottomNavbarWidget(
                  isSearchNeeded: false,
                  children: _loadChildren(context),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

List<Widget> _loadChildren(BuildContext context) {
  final _children = [
    InkWell(
      onTap: () => context.router.push(const AddExpenseTrackerRoute()),
      child: const Icon(Icons.add_circle_outline, color: Colors.white),
    ),
  ];

  return _children;
}
