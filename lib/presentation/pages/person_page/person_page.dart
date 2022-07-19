import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/user/user_bloc.dart';
import '../../core/constants/constant_colors.dart';
import 'widgets/person_profile_summary.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final person = context.read<UserBloc>().state.currentlyLookedUpUser;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  PersonProfileSummary(),
                  ElevatedButton(
                      onPressed: () => context
                          .read<UserBloc>()
                          .add(UserEvent.userFollowToggled(person.uid)),
                      child: const Text('Follow')),
                  ElevatedButton(
                      onPressed: () => context
                          .read<UserBloc>()
                          .add(UserEvent.addToFriendsPressed(person.uid)),
                      child: const Text('Add to friends')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
