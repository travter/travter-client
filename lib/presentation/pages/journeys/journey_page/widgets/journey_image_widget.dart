import 'package:flutter/material.dart';

import '../../../../core/extensions.dart';

class JourneyImageWidget extends StatelessWidget {
  const JourneyImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

    return Container(
      height: height * 0.4,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/niagara_falls.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.025, left: width * 0.05),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: height * 0.01,
                  vertical: width * 0.01,
                ),
                child: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.white.withOpacity(0.9),
                  size: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: height * 0.125),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: height * 0.005),
                  width: width * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.circle, color: Colors.white, size: 11),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                        child: Icon(Icons.circle,
                            color: _circleIconGreyColor, size: 11),
                      ),
                      Icon(Icons.circle, color: _circleIconGreyColor, size: 11),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                        child: Icon(Icons.circle,
                            color: _circleIconGreyColor, size: 11),
                      ),
                      Icon(Icons.circle, color: _circleIconGreyColor, size: 11),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final _circleIconGreyColor = Colors.white.withOpacity(0.25);
