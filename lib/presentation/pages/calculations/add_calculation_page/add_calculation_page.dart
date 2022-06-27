import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/expenses_tracker/expenses_tracker_form/expenses_tracker_form_bloc.dart';
import '../../../../injection.dart';
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
          child: BlocProvider(
            create: (context) => getIt<ExpensesTrackerFormBloc>(),
            child:
            BlocConsumer<ExpensesTrackerFormBloc, ExpensesTrackerFormState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Column(
                  children: [
                    const ClosePageWidget(),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    const _TextFieldWidget(
                      textFormField: _TrackerNameFieldWidget('Tracker Name'),
                    ),
                    const _AddExpenseWidget(),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    const AddPeopleWidget(
                        'Add people to this expenses tracker'),
                    const _AddCalculationButtonWidget(),
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

class _TextFieldWidget extends StatelessWidget {
  const _TextFieldWidget({
    required this.textFormField,
    Key? key,
  }) : super(key: key);

  final Widget textFormField;

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
          child: textFormField,
        ),
      ),
    );
  }
}

class _TrackerNameFieldWidget extends StatelessWidget {
  const _TrackerNameFieldWidget(this._text, {Key? key}) : super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: _getInputDecoration(_text),
      onChanged: (value) =>
          context.read<ExpensesTrackerFormBloc>().add(
            ExpensesTrackerFormEvent.trackerNameChanged(value),
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
          const _TextFieldWidget(
            textFormField: _ExpenseNameFieldWidget('Expense Name'),),
          const _TextFieldWidget(
            textFormField: _MoneyAmountFieldWidget('Money amount'),),
        ],
      ),
    );
  }
}

class _ExpenseNameFieldWidget extends StatelessWidget {
  const _ExpenseNameFieldWidget(this._text, {Key? key}) : super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: _getInputDecoration(_text),
      onChanged: (value) =>
          context.read<ExpensesTrackerFormBloc>().add(
            ExpensesTrackerFormEvent.expenseNameChanged(value),
          ),
    );
  }
}

class _MoneyAmountFieldWidget extends StatelessWidget {
  const _MoneyAmountFieldWidget(this._text, {Key? key}) : super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: _getInputDecoration(_text),
      onChanged: (value) =>
          context.read<ExpensesTrackerFormBloc>().add(
            ExpensesTrackerFormEvent.expenseAmountChanged(double.tryParse(value) ?? 0),
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
        onTap: () => context.read<ExpensesTrackerFormBloc>().add( const
          ExpensesTrackerFormEvent.submitFormPressed(),
        ),
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

InputDecoration _getInputDecoration(String hintText) {
  return InputDecoration(
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    hintText: hintText,
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontSize: 14,
    ),
  );
}
