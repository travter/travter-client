import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/journey/journey_bloc.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/travel_card.dart';

class FeedSectionWidget extends StatelessWidget {
  const FeedSectionWidget({required this.text, Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * homePageHorizontalPadding,
      ),
      child: Container(
        width: double.infinity,
        child: BlocBuilder<JourneyBloc, JourneyState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // _FeedTextWidget(text: text),
                for(final journey in state.journeys)
                  TravelCard(journey: journey),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _FeedTextWidget extends StatelessWidget {
  const _FeedTextWidget({required this.text, Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: lightBlueColor,
                  width: width * 0.005,
                ),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
