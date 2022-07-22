import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/search/search_bloc.dart';
import '../../core/constants/constant_colors.dart';
import '../../core/constants/constant_dimensions.dart';
import '../../core/extensions.dart';
import '../../core/widgets/clickable/go_back_clickable_widget.dart';
import '../../core/widgets/clickable/person_card_clickable_widget.dart';
import '../../core/widgets/travel_card_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.dims.width;
    final screenHeight = context.dims.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * homePageHorizontalPadding,
            vertical: screenHeight * 0.05,
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const GoBackClickableWidget(),
                        SizedBox(height: screenHeight * 0.05),
                        for (final journey in state.searchResult.foundJourneys)
                          TravelCardWidget(journey: journey),
                        for (final user in state.searchResult.foundUsers)
                          PersonCardClickableWidget(user),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
