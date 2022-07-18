import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/journey/journey_bloc.dart';
import '../../../application/user/user_bloc.dart';
import '../../core/constants/constant_colors.dart';
import '../../core/extensions.dart';
import '../../core/widgets/bottom_navbar_widget.dart';
import '../../router/router.gr.dart';
import 'widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height * 0.8, minHeight: height * 0.8),
              child: SingleChildScrollView(
                child: Column(children: const [
                  WelcomeWidget(),
                  // ResultsOptionsWidget(),
                  // PopularPlacesWidget(text:'Popular Places'),
                  // PopularPeopleWidget(),
                  FeedSectionWidget(text: ''),
                ]),
              ),
            ),
            BottomNavbarWidget(children: _loadChildren(context)),
          ],
        ),
      ),
    );
  }
}

List<Widget> _loadChildren(BuildContext context) {
  final _children = [
    InkWell(
      onTap: () => context.router.push(const AddJourneyInfoRoute()),
      child: const Icon(Icons.add_circle_outline, color: Colors.white),
    ),
    InkWell(
      onTap: () => context.router.push(const CalculationsRoute()),
      child: const Icon(Icons.calculate_outlined, color: Colors.white),
    ),
    InkWell(
      onTap: () {
        context.read<JourneyBloc>().add(JourneyEvent.likedJourneysRequested(
          context.read<UserBloc>().state.user.likedPostsIds,
        ));
        context.router.push(
          const FavoriteEntriesRoute(),
        );
      },
      child: const Icon(Icons.favorite_border, color: Colors.white),
    ),
    InkWell(
      onTap: () => context.router.push(
        const ProfileRoute(),
      ),
      child: const Icon(Icons.account_circle, color: Colors.white),
    ),
  ];

  return _children;
}
