import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';

class CalculationPage extends StatelessWidget {
  const CalculationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * homePageHorizontalPadding,
              vertical: height * 0.05,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: lightBlueColor,
                            width: 1.5,
                          ),
                        ),
                      ),
                      child: const Text(
                        'US Trip',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const Icon(Icons.more_vert, color: Colors.white),
                  ],
                ),
                const _ExpenseWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ExpenseWidget extends StatelessWidget {
  const _ExpenseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Container(
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
            const Text(
              'Pizza',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.015),
              child: Row(
                children: const [
                  Text(
                    'Money Amount: ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    '\$38.00',
                    style: TextStyle(
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
                  ' Marek Kowalski',
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
    );
  }
}
