import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/journey/journey_form/journey_form_bloc.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';

class PickDateWidget extends StatelessWidget {
  const PickDateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;

    return Padding(
      padding: EdgeInsets.only(left: width * homePageHorizontalPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DateTimePicker(
          initialValue: '',
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          decoration: const InputDecoration(
            labelText: 'Start Date',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          dateLabelText: 'Date',
          style: const TextStyle(
            color: Colors.white,
          ),
          onChanged: (date) => context
              .read<JourneyFormBloc>()
              .add(JourneyFormEvent.dateSelected(date)),
        ),
      ),
    );
  }
}
