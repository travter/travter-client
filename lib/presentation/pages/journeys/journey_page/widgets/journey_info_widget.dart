import 'package:flutter/material.dart';

import '../../../../core/constants/constant_dimensions.dart';
import '../../../../core/extensions.dart';
import 'section_header_text_widget.dart';

class JourneyInfoWidget extends StatelessWidget {
  const JourneyInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

    return Padding(
      padding: EdgeInsets.only(top: height * 0.3),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.025,
          horizontal: width * homePageHorizontalPadding,
        ),
        height: height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.015),
                      child: const Text(
                        'Omaha Beach',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 13,
                          backgroundImage:
                              AssetImage('assets/images/profile_picture.jpeg'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.015),
                          child: const Text(
                            'Wiktor Zając',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.015, vertical: height * 0.015),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.15),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.025,
            ),
            const SectionHeaderTextWidget('Visited Places'),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.place),
                      Text('Warsaw'),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.place),
                      Text('Warsaw'),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.place),
                      Text('Warsaw'),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.place),
                      Text('Warsaw'),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.place),
                      Text('Warsaw'),
                    ],
                  ),
                ]
              ),
            )
            // const Text('Description'),
            // const Text(_lorem),
          ],
        ),
      ),
    );
  }
}

const _lorem =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pretium euismod turpis, sed placerat ante venenatis a. Nam condimentum facilisis eleifend. Vestibulum lacinia, ligula vitae accumsan faucibus, risus urna volutpat ex, id accumsan lacus mi vitae erat. Proin vulputate, eros sed rhoncus feugiat, mi tortor fringilla metus, in dapibus nisi felis ac lectus. Donec ultrices, odio eu eleifend dapibus, lorem ipsum efficitur massa, id consequat magna ligula et nunc. Pellentesque sagittis ultrices mauris sed fringilla. Sed ac mi viverra, fermentum nisi eu, luctus felis. Fusce rhoncus laoreet risus, at mollis ipsum blandit at. Donec condimentum finibus interdum. Suspendisse potenti. Quisque scelerisque luctus sollicitudin. Suspendisse condimentum viverra ipsum, vel feugiat ipsum iaculis vitae. Sed ligula metus, venenatis eget ligula vel, sollicitudin dignissim ex. Aliquam sit amet diam dolor.';
