import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../router/router.gr.dart';
import '../constants/constant_colors.dart';
import '../extensions.dart';

class TravelCard extends StatelessWidget {
  const TravelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

    return Padding(
      padding: EdgeInsets.only(top: height * 0.025),
      child: Container(
        padding: EdgeInsets.only(
          top: height * 0.02,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: lightPrimaryColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.025),
              child: Row(
                children: [
                  const Text('Szeszele', style: _topTravelInfoStyle),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    child: const Text('•', style: _topTravelInfoStyle),
                  ),
                  const Text('26.04.2022', style: _topTravelInfoStyle),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => context.router.push(const EditJourneyRoute()),
                        child: const Icon(Icons.more_horiz, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.0075, horizontal: width * 0.025),
              child: const Text(
                'Probably the best 2 weeks of my life in Victoria!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: height * 0.25,
              child:
                  Image.asset('assets/images/seszele.jpeg', fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.035),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: darkPrimaryColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.015,
                  ),
                  child: InkWell(
                    onTap: () => context.router.push(const JourneyRoute()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.keyboard_arrow_down_outlined,
                            color: Colors.white.withOpacity(0.8)),
                        Text(
                          'Show More',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const _topTravelInfoStyle = TextStyle(
  color: Colors.grey,
  fontSize: 12,
);
