import 'package:auto_route/auto_route.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constant_colors.dart';
import '../../../../core/extensions.dart';
import '../../../../router/router.gr.dart';
import '../../widgets/avatars_stack_widget.dart';

part 'decorations.dart';


class CalculationCardWidget extends StatelessWidget {
  const CalculationCardWidget({required this.tracker, Key? key})
      : super(key: key);

  final ExpensesTracker tracker;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.025),
      child: Container(
        width: width * 0.9,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.02,
        ),
        decoration: _cardBoxDecoration,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _CalculationTitleWidget('Seszele'),
                  _TotalExpensesWidget(),
                  _ExpensesValueWidget(223),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: const [
                  _OpenCalculationWidget(),
                  AvatarsStackWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CalculationTitleWidget extends StatelessWidget {
  const _CalculationTitleWidget(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
        fontSize: 16,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}

class _TotalExpensesWidget extends StatelessWidget {
  const _TotalExpensesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.015),
      child: const Text(
        'Total Expenses',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class _ExpensesValueWidget extends StatelessWidget {
  const _ExpensesValueWidget(this.value, {Key? key}) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$$value',
      style: const TextStyle(
        color: lightGreenColor,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('value', value));
  }
}

class _OpenCalculationWidget extends StatelessWidget {
  const _OpenCalculationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.03),
      child: Align(
        alignment: Alignment.topRight,
        child: InkWell(
          onTap: () => context.router.push(const CalculationRoute()),
          child: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        ),
      ),
    );
  }
}



