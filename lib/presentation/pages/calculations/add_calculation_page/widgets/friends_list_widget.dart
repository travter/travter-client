import 'package:auth_repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/expenses_tracker/expenses_tracker_form/expenses_tracker_form_bloc.dart';
import '../../../../../application/user/user_bloc.dart';
import '../../../../core/constants/constant_colors.dart';
import '../../../../core/extensions.dart';
import 'selectable_friend_widget.dart';

class FriendsListWidget extends StatelessWidget {
  const FriendsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.025),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: lightPrimaryColor,
                    width: 3,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Select friends',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  InkWell(
                    onTap: () => context.read<ExpensesTrackerFormBloc>().add(
                        const ExpensesTrackerFormEvent.addPeopleFinished()),
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            FutureBuilder<Either<RequestFailure, List<User>>>(
              future: context.read<DataRepository>().fetchUsersFriends(
                  context.read<UserBloc>().state.user.friends),
              builder: (context, snapshot) {
                var children = <Widget>[];
                snapshot.data?.fold((_) {}, (users) {
                  children = [
                    Column(
                      children: [
                        for (final user in users) SelectableFriendWidget(user),
                      ],
                    ),
                  ];
                });
                return SingleChildScrollView(
                  child: Column(
                    children: children,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
