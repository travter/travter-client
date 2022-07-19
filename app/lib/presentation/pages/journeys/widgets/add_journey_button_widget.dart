import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/journey/journey_form/journey_form_bloc.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';

class AddJourneyButtonWidget extends StatelessWidget {
  const AddJourneyButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(
        left: width * homePageHorizontalPadding,
        right: width * homePageHorizontalPadding,
        top: height * 0.05,
      ),
      child: InkWell(
        onTap: () => context.read<JourneyFormBloc>().add(
              const JourneyFormEvent.submitFormPressed(),
            ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.025,
            ),
            child: const Center(
              child: Text(
                'Add journey!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
