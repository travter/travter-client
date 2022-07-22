import 'package:auth_repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/user/user_bloc.dart';
import '../../../infrastructure/core/constants/enums.dart';
import '../constants/constant_colors.dart';
import '../extensions.dart';
import 'selectable_friend_widget.dart';

class FriendsListWidget extends StatelessWidget {
  const FriendsListWidget({
    required this.entryType,
    required this.onListClosed,
    Key? key,
  }) : super(key: key);

  final CollaborativeEntryType entryType;
  final void Function() onListClosed;

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
          horizontal: width * 0.05,
          vertical: height * 0.025,
        ),
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
                  const _SelectFriendsTextWidget(),
                  InkWell(
                    onTap: onListClosed,
                    child: const _CheckIconWidget(),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.025),
            _FriendsListView(entryType),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        ObjectFlagProperty<void Function()>.has('onListClosed', onListClosed));
  }
}

class _FriendsListView extends StatelessWidget {
  const _FriendsListView(this.entryType, {Key? key}) : super(key: key);

  final CollaborativeEntryType entryType;

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<Either<RequestFailure, List<User>>>(
        future: context.read<DataRepository>().fetchUsersFriends(
              context.read<UserBloc>().state.user.friends,
            ),
        builder: (context, snapshot) {
          var children = <Widget>[];
          snapshot.data?.fold((_) {}, (users) {
            children = [
              Column(
                children: [
                  for (final user in users)
                    SelectableFriendWidget(
                      user,
                      entryType: entryType,
                    ),
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
    );
  }
}

class _CheckIconWidget extends StatelessWidget {
  const _CheckIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(5),
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }
}

class _SelectFriendsTextWidget extends StatelessWidget {
  const _SelectFriendsTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Select friends',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }
}
