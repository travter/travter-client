import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/go_back_widget.dart';
import '../widgets/widgets.dart';

class AddCollaborativeJourneyPage extends StatelessWidget {
  const AddCollaborativeJourneyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Padding(
          padding: EdgeInsets.only(top: height * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width * homePageHorizontalPadding),
                  child: const GoBackWidget(),
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
                const AddPeopleWidget(),
                const UploadPhotosWidget(),
                const AddJourneyButtonWidget(),
                Divider(
                  height: height * 0.05,
                  color: lightPrimaryColor,
                ),
              ],
            ),
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
      padding: EdgeInsets.symmetric(horizontal:width * homePageHorizontalPadding ),
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
    final height = context.dims.height;

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
          ),
        ),
      ),
    );
  }
}
