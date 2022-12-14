import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:functionalities_repository/functionalities_repository.dart';

import '../../../../application/journey/journey_form/journey_form_bloc.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/clickable/go_back_clickable_widget.dart';
import '../../../router/router.gr.dart';
import '../widgets/pick_date_widget.dart';
import '../widgets/widgets.dart';

class AddJourneyPage extends StatelessWidget {
  const AddJourneyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Padding(
          padding: EdgeInsets.only(top: height * 0.05),
          child: BlocProvider(
            create: (_) => JourneyFormBloc(
              context.read<AuthenticationRepository>(),
              context.read<DataRepository>(),
              context.read<FunctionalitiesRepository>(),
            ),
            child: const _AddJourneyView(),
          ),
        ),
      ),
    );
  }
}

class _AddJourneyView extends StatelessWidget {
  const _AddJourneyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;

    return BlocConsumer<JourneyFormBloc, JourneyFormState>(
      listener: (context, state) {
        state.requestResult.fold(
          () => null,
          (result) => result.fold((_) => () => null, (_) {
            context.router.popAndPush(const JourneyRoute());
          }),
        );
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * homePageHorizontalPadding),
              child: const GoBackClickableWidget(),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: context.dims.height * 0.8,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    AddJourneyFormWidget(),
                    // AddPeopleWidget(),
                    PickDateWidget(),
                    UploadPhotosWidget(),
                    AddJourneyButtonWidget(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
