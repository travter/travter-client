import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/expenses_tracker/expenses_tracker_form/expenses_tracker_form_bloc.dart';
import '../../../../infrastructure/core/constants/enums.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/clickable/close_page_clickable_widget.dart';
import '../../../core/widgets/friends_list_widget.dart';
import '../widgets/clickable/add_people_clickable_widget.dart';
import '../widgets/expense_field_name_widget.dart';
import '../widgets/money_amount_field_widget.dart';
import '../widgets/text_field_widget.dart';

class AddExpenseTrackerPage extends StatelessWidget {
  const AddExpenseTrackerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: BlocProvider(
          create: (context) => ExpensesTrackerFormBloc(
            context.read<DataRepository>(),
            context.read<AuthenticationRepository>(),
          ),
          child: const AddCalculationView(),
        ),
      ),
    );
  }
}

class AddCalculationView extends StatelessWidget {
  const AddCalculationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

    return BlocBuilder<ExpensesTrackerFormBloc, ExpensesTrackerFormState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.025,
            horizontal: width * homePageHorizontalPadding,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  const ClosePageClickableWidget(),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  const TextFieldWidget(
                    textFormField: _TrackerNameFieldWidget('Tracker Name'),
                  ),
                  const _AddExpenseWidget(),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  const AddPeopleClickableWidget(),
                  const _AddCalculationButtonWidget(),
                ],
              ),
              if (state.addPeopleStatus == AddPeopleStatus.started)
                FriendsListWidget(
                  entryType: CollaborativeEntryType.tracker,
                  onListClosed: () =>
                      context.read<ExpensesTrackerFormBloc>().add(
                            const ExpensesTrackerFormEvent.addPeopleFinished(),
                          ),
                ),
            ],
          ),
        );
      },
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
      onChanged: (value) => context.read<ExpensesTrackerFormBloc>().add(
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
          const TextFieldWidget(
            textFormField: ExpenseNameFieldWidget('Expense Name'),
          ),
          const TextFieldWidget(
            textFormField: MoneyAmountFieldWidget('Money amount'),
          ),
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
        onTap: () {
          context.read<ExpensesTrackerFormBloc>().add(
                const ExpensesTrackerFormEvent.submitFormPressed(),
              );
          context.router.pop();
        },
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


