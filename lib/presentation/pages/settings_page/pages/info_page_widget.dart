import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';
import '../../../core/widgets/clickable/go_back_clickable_widget.dart';

class InfoPageWidget extends StatelessWidget {
  const InfoPageWidget({
    required this.header,
    required this.text,
    Key? key,
  }) : super(key: key);

  final String header;
  final String text;

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.05,
            horizontal: width * homePageHorizontalPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GoBackClickableWidget(),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: height * 0.025, top: height * 0.05),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                        color: lightBlueColor,
                      )),
                    ),
                    child: Text(
                      header,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(StringProperty('header', header));
  }
}
