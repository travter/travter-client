import 'package:auth_repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/user/user_bloc.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/clickable/person_card_clickable_widget.dart';

class FriendsLookupWidget extends StatelessWidget {
  const FriendsLookupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.dims.height * 0.025),
      child: Container(
        decoration: BoxDecoration(
            color: lightPrimaryColor, borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.dims.width * homePageHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Friends',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              FutureBuilder<Either<RequestFailure, List<User>>>(
                future: context.read<DataRepository>().fetchUsersFriends(
                      context.read<UserBloc>().state.user.friends,
                    ),
                builder: (context, snapshot) {
                  var children = <Widget>[];
                  snapshot.data?.fold(
                    (_) {},
                    (users) {
                      children = [
                        Row(
                          children: [
                            for (final user in users)
                              PersonCardClickableWidget(user),
                          ],
                        ),
                      ];
                    },
                  );
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: children,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
