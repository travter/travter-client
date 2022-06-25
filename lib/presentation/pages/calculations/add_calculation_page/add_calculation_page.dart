import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/add_people_widget.dart';
import '../../../core/widgets/close_page_widget.dart';

class AddCalculationPage extends StatelessWidget {
  const AddCalculationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.025,
            horizontal: width * homePageHorizontalPadding,
          ),
          child: Column(
            children: [
              const ClosePageWidget(),
              SizedBox(
                height: height * 0.025,
              ),
              const _TrackerNameTextFieldWidget('Tracker Name'),
              const _AddExpenseWidget(),
              SizedBox(
                height: height * 0.025,
              ),
              const AddPeopleWidget('Add people to this expenses tracker'),
              const _AddCalculationButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrackerNameTextFieldWidget extends StatelessWidget {
  const _TrackerNameTextFieldWidget(this._text, {Key? key}) : super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.01,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: TextFormField(
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: _text,
              hintStyle: const TextStyle(
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

class _AddExpenseWidget extends StatelessWidget {
  const _AddExpenseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.025,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: height * 0.025,
              bottom: height * 0.015,
              left: width * 0.015,
            ),
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: lightBlueColor,
                width: 1.5,
              ))),
              child: const Text(
                'Add first expense!',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const _TrackerNameTextFieldWidget('Expense name'),
          const _TrackerNameTextFieldWidget('Money amount'),
        ],
      ),
    );
  }
}

class _AddCalculationButtonWidget extends StatelessWidget {
  const _AddCalculationButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(
        left: width * homePageHorizontalPadding,
        right: width * homePageHorizontalPadding,
        top: height * 0.1,
      ),
      child: InkWell(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                blurRadius: 3,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.025,
            ),
            child: const Center(
              child: Text(
                'Add Tracker',
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
