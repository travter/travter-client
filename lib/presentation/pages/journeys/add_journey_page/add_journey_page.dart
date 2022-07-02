import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/journey/journey_form/journey_form_bloc.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/go_back_widget.dart';
import '../../../router/router.gr.dart';
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
              child: const GoBackWidget(),
            ),
            const AddJourneyFormWidget(),
            // AddPeopleWidget(),
            const UploadPhotosWidget(),
            const AddJourneyButtonWidget(),
          ],
        );
      },
    );
  }
}
