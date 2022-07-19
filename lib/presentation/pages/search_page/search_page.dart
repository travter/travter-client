import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/search/search_bloc.dart';
import '../../core/constants/constant_colors.dart';
import '../../core/widgets/person_card_widget.dart';
import '../../core/widgets/travel_card_widget.dart';

class SearchPage extends StatelessWidget{
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Column(
          children: [
            SingleChildScrollView(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      for (final journey in state.searchResult.foundJourneys)
                        TravelCardWidget(journey: journey),
                      for (final user in state.searchResult.foundUsers)
                        PersonCardWidget(user),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
