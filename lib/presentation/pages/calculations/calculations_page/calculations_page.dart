import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                Container(
                  height: height * 0.725,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.015,
                        left: width * 0.015,
                        right: width * 0.015,
                      ),
                      child: FutureBuilder<
                          Either<RequestFailure,
                              Stream<List<ExpensesTracker>>>>(
                        future: context
                            .read<DataRepository>()
                            .getAllUsersExpenseTrackers(
                          context
                              .read<UserBloc>()
                              .state
                              .user
                              .uid,
                        ),
                        builder: (context, snapshot) {
                          var children = <Widget>[];
                          snapshot.data?.fold((_) {}, (trackers) {
                            children = [
                              StreamBuilder<List<ExpensesTracker>>(
                                stream: trackers,
                                builder: (context, snapshot) {
                                  print('======');
                                  print('xd');
                                  print('======');
                                  if (snapshot.data != null) {
                                    for(final tracker in snapshot.data!) {
                                      // return CalculationCardWidget(tracker: tracker);
                                    }
                                  }
                                  return Container();
                                },
                              ),
                            ];
                          });

                          return Column(
                            children: children,
                          );
                        },
                      ),
                      /*
                      Column(
                        children: [
                          for (final tracker in state.trackers)
                            CalculationCardWidget(
                              tracker: tracker,
                            ),
                        ],
                      ),

                           */
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
      onTap: () => context.router.push(const AddCalculationRoute()),
      child: const Icon(Icons.add_circle_outline, color: Colors.white),
    ),
  ];

  return _children;
}
