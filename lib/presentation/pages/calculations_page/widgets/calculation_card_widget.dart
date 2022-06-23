import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/extensions.dart';

class CalculationCardWidget extends StatelessWidget {
  const CalculationCardWidget({Key? key}) : super(key: key);

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
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(2, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Seszele',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.015),
                    child: const Text(
                      'Total Expenses',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Text(
                    r'$223.00',
                    style: TextStyle(
                      color: lightGreenColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.03),
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.15),
                          child: const CircleAvatar(
                            radius: 16,
                            backgroundColor: lightGreenColor,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(
                                'assets/images/brad_pitt.jpeg',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.075),
                          child: const CircleAvatar(
                            radius: 16,
                            backgroundColor: lightGreenColor,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(
                                'assets/images/julie_roberts.jpeg',
                              ),
                            ),
                          ),
                        ),
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: lightGreenColor,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(
                              'assets/images/profile_picture.jpeg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
