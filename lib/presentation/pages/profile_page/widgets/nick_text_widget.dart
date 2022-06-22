import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../core/extensions.dart';

class NickTextWidget extends StatelessWidget {
  const NickTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;
    final lightWhite = Colors.white.withOpacity(0.9);

    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.05,
        bottom: height * 0.025,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: context.dims.width * (1 / 3),
            padding: EdgeInsets.only(left: width * 0.025),
            child: Row(children: [
              Icon(
                Icons.arrow_back_ios_new,
                color: lightWhite,
              ),
              const Text(
                'Back',
                style: TextStyle(color: Colors.grey),
              ),
            ]),
          ),
          Container(
            width: context.dims.width * (1 / 3),
            child: Center(
              child: Text(
                'Creatix',
                style: TextStyle(
                  color: lightWhite,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          Container(
            width: context.dims.width * (1 / 3),
            child: Padding(
              padding: EdgeInsets.only(right: width * 0.025),
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.more_horiz,
                  color: lightWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
