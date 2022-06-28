import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/journey/journey_bloc.dart';
import '../../../../application/journey/journey_form/journey_form_bloc.dart';
import '../../../../injection.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/go_back_widget.dart';
import '../widgets/widgets.dart';

class AddJourneyPage extends StatelessWidget {
  const AddJourneyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Padding(
          padding: EdgeInsets.only(top: height * 0.05),
          child: BlocProvider(
            create: (context) => getIt<JourneyFormBloc>(),
            child: BlocConsumer<JourneyFormBloc, JourneyFormState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * homePageHorizontalPadding),
                      child: const GoBackWidget(),
                    ),
                    const AddJourneyFormWidget(),
                    // AddPeopleWidget(),
                    const UploadPhotosWidget(),
                    const AddJourneyButtonWidget(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

