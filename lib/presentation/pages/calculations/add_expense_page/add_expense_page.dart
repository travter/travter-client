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

class AddExpensePage extends StatelessWidget {
  const AddExpensePage({Key? key}) : super(key: key);

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
          child: const _AddExpenseView(),
        ),
      ),
    );
  }
}

class _AddExpenseView extends StatelessWidget {
  const _AddExpenseView({Key? key}) : super(key: key);

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
                  SizedBox(
                    height: height * 0.025,
                  ),
                  const TextFieldWidget(
                    textFormField: ExpenseNameFieldWidget('Expense Name'),
                  ),
                  const TextFieldWidget(
                    textFormField: MoneyAmountFieldWidget('Money amount'),
                  ),
                  const SizedBox(height: 20),
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
                'Add Expense',
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
