import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/collaborative_journey/collaborative_journey_form/collaborative_journey_form_bloc.dart';
import '../extensions.dart';

class SelectPeopleWidget extends StatelessWidget {
  const SelectPeopleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return InkWell(
      onTap: () => context.read<CollaborativeJourneyFormBloc>().add(
            const CollaborativeJourneyFormEvent.addPeopleFinished(),
          ),
      child: Container(
        height: height * 0.5,
        width: width * 0.8,
        color: Colors.green,
      ),
    );
  }
}
