import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/user/user_bloc.dart';
import '../../core/constants/constant_colors.dart';
import '../../core/constants/constant_dimensions.dart';
import '../../core/extensions.dart';
import '../../core/widgets/clickable/go_back_clickable_widget.dart';
import 'widgets/person_profile_summary.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final person = context.read<UserBloc>().state.currentlyLookedUpUser;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.dims.width * homePageHorizontalPadding,
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const GoBackClickableWidget(),
                    const PersonProfileSummary(),
                    ElevatedButton(
                        onPressed: () => context
                            .read<UserBloc>()
                            .add(UserEvent.userFollowToggled(person.uid)),
                        child: context
                                .watch<UserBloc>()
                                .state
                                .user
                                .following
                                .contains(person.uid)
                            ? const Text('Unfollow')
                            : const Text('Follow')),
                    if (context
                        .watch<UserBloc>()
                        .state
                        .user
                        .friends
                        .contains(person.uid))
                      Container()
                    else
                      ElevatedButton(
                        onPressed: () => context
                            .read<UserBloc>()
                            .add(UserEvent.addToFriendsPressed(person.uid)),
                        child: const Text('Add to friends'),
                      ),
                    const SizedBox(height: 40),
                    const Text(
                      'Profile page is going to contain much more stuff, stay tuned 😎',
                      style: TextStyle(
                        color: lightGreenColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
