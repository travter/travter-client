import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/collaborative_journey/collaborative_journey_bloc.dart';
import '../../../application/journey/journey_bloc.dart';
import '../../core/constants/constant_colors.dart';
import '../../core/extensions.dart';
import '../../core/widgets/travel_card_widget.dart';
import 'widgets/friends_lookup_widget.dart';
import 'widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: context.dims.height * 0.035),
            child: Column(children: const [
              NickTextWidget(),
              ProfileSummary(),
              FriendsLookupWidget(),
              // _JourneysListWidget(),
              // _CollaborativeJourneysListWidget(),
            ]),
          ),
        ),
      ),
    );
  }
}

class _JourneysListWidget extends StatelessWidget {
  const _JourneysListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JourneyBloc, JourneyState>(
      builder: (context, state) {
        return Column(
          children: [
            for (final journey in state.journeys)
              TravelCardWidget(
                journey: journey,
              )
          ],
        );
      },
    );
  }
}

class _CollaborativeJourneysListWidget extends StatelessWidget {
  const _CollaborativeJourneysListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollaborativeJourneyBloc, CollaborativeJourneyState>(
      builder: (context, state) {
        return Column(
          children: [
            for (var _ = 0; _ < state.journeys.length; _++)
              TravelCardWidget(
                journey: Journey.empty(),
              )
          ],
        );
      },
    );
  }
}
