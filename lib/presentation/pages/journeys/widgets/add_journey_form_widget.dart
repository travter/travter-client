import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/journey/journey_form/journey_form_bloc.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';

class AddJourneyFormWidget extends StatelessWidget {
  const AddJourneyFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * homePageHorizontalPadding,
          vertical: height * 0.05),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'Journey name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                onChanged: (val) => context.read<JourneyFormBloc>().add(
                      JourneyFormEvent.nameChanged(val),
                    ),
              ),
            ),
          ),
          Divider(
            height: height * 0.01,
            color: lightPrimaryColor,
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'Visited places',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                onChanged: (val) => context.read<JourneyFormBloc>().add(
                      JourneyFormEvent.visitedPlacesChanged(
                        List<String>.empty(growable: true)..add(val),
                      ),
                    ),
              ),
            ),
          ),
          Divider(
            height: height * 0.01,
            color: lightPrimaryColor,
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: TextFormField(
                decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'Description of the journey...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                onChanged: (val) => context.read<JourneyFormBloc>().add(
                      JourneyFormEvent.descriptionChanged(val),
                    ),
                maxLines: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
