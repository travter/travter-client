import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/collaborative_journey/collaborative_journey_form/collaborative_journey_form_bloc.dart';
import '../../../../infrastructure/core/constants/enums.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/clickable/add_people_clickable_widget.dart';
import '../../../core/widgets/clickable/go_back_clickable_widget.dart';
import '../../../core/widgets/friends_list_widget.dart';
import '../../../router/router.gr.dart';
import '../widgets/widgets.dart';
import 'widgets/add_collaborative_journey_button.dart';

class AddCollaborativeJourneyPage extends StatelessWidget {
  const AddCollaborativeJourneyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollaborativeJourneyFormBloc(
        context.read<AuthenticationRepository>(),
        context.read<DataRepository>(),
      ),
      child: const _AddCollaborativeJourneyView(),
    );
  }
}

class _AddCollaborativeJourneyView extends StatelessWidget {
  const _AddCollaborativeJourneyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Padding(
          padding: EdgeInsets.only(top: height * 0.05),
          child: BlocConsumer<CollaborativeJourneyFormBloc,
              CollaborativeJourneyFormState>(
            listener: (context, state) {
              state.requestResult.fold(
                () => null,
                (result) => result.fold((_) => () => null, (_) {
                  context.router.popAndPush(const JourneyRoute());
                }),
              );
            },
            builder: (context, state) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * homePageHorizontalPadding),
                          child: const GoBackClickableWidget(),
                        ),
                        // const AddJourneyFormWidget(),
                        const _JourneyNameFieldWidget(),
                        const _MemoryExplanationWidget(),
                        Divider(
                          height: height * 0.01,
                          color: lightPrimaryColor,
                        ),
                        const _MemoryNameFieldWidget(),
                        const _MemoryDescriptionFieldWidget(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * homePageHorizontalPadding,
                          ),
                          child: const AddPeopleClickableWidget(
                              'Add people to your journey'),
                        ),
                        // const UploadPhotosWidget(),
                        const AddCollaborativeJourneyButtonWidget(),
                        Divider(
                          height: height * 0.05,
                          color: lightPrimaryColor,
                        ),
                      ],
                    ),
                  ),
                  if (state.addPeopleStatus == AddPeopleStatus.started)
                    FriendsListWidget(
                      entryType: CollaborativeEntryType.journey,
                      onListClosed: () =>
                          context.read<CollaborativeJourneyFormBloc>().add(
                                const CollaborativeJourneyFormEvent
                                    .addPeopleFinished(),
                              ),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _MemoryExplanationWidget extends StatelessWidget {
  const _MemoryExplanationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * homePageHorizontalPadding),
      child: Text(
        'Add your first memory to the journey! ',
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 12.5,
        ),
      ),
    );
  }
}

class _JourneyNameFieldWidget extends StatelessWidget {
  const _JourneyNameFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * homePageHorizontalPadding,
        vertical: height * 0.05,
      ),
      child: Container(
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
            onChanged: (val) =>
                context.read<CollaborativeJourneyFormBloc>().add(
                      CollaborativeJourneyFormEvent.journeyNameChanged(val),
                    ),
          ),
        ),
      ),
    );
  }
}

class _MemoryNameFieldWidget extends StatelessWidget {
  const _MemoryNameFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * homePageHorizontalPadding,
      ),
      child: Container(
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
              hintText: 'Day 1...',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            onChanged: (val) =>
                context.read<CollaborativeJourneyFormBloc>().add(
                      CollaborativeJourneyFormEvent.memoryNameChanged(val),
                    ),
          ),
        ),
      ),
    );
  }
}

class _MemoryDescriptionFieldWidget extends StatelessWidget {
  const _MemoryDescriptionFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * homePageHorizontalPadding,
        vertical: height * 0.025,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: TextFormField(
            maxLines: 10,
            decoration: const InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: 'We went to the beach...',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            onChanged: (val) => context
                .read<CollaborativeJourneyFormBloc>()
                .add(
                  CollaborativeJourneyFormEvent.memoryDescriptionChanged(val),
                ),
          ),
        ),
      ),
    );
  }
}
