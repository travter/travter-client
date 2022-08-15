import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/expenses_tracker/expenses_tracker_form/expenses_tracker_form_bloc.dart';

class MoneyAmountFieldWidget extends StatelessWidget {
  const MoneyAmountFieldWidget(this._text, {Key? key}) : super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: _text,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
      ),
      onChanged: (value) => context.read<ExpensesTrackerFormBloc>().add(
        ExpensesTrackerFormEvent.expenseAmountChanged(
            double.tryParse(value) ?? 0),
      ),
    );
  }
}