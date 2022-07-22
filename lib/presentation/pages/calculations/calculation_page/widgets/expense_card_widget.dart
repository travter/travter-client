import 'package:data_repository/data_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constant_colors.dart';
import '../../../../core/extensions.dart';

class ExpenseCardWidget extends StatelessWidget {
  const ExpenseCardWidget({required this.expense, Key? key}) : super(key: key);

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.015),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: primaryColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expense.name,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.015),
                child: Row(
                  children: [
                    const Text(
                      'Money Amount: ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '${expense.moneyAmount}',
                      style: const TextStyle(
                        color: lightBlueColor,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 12,
                    backgroundImage:
                        AssetImage('assets/images/profile_picture.jpeg'),
                  ),
                  Text(
                    'Marek Kowalski',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Expense>('expense', expense));
  }
}
