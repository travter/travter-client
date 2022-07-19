import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/extensions.dart';
import '../../../router/router.gr.dart';

const _assetPath = 'assets/images';

class PopularPersonCardWidget extends StatelessWidget {
  const PopularPersonCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;

    return Padding(
      padding: EdgeInsets.only(right: width * 0.05),
      child: InkWell(
        onTap: () => context.router.push(const ProfileRoute()),
        child: Container(
          width: width * 0.425,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _ImageWidget(),
              _PlaceNameWidget(),
              _ShortBioWidget(),
              _JourneysMade(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.015),
      child: Center(
        child: CircleAvatar(
          radius: context.dims.width * 0.1,
          backgroundImage: const AssetImage('$_assetPath/profile_picture.jpeg'),
        ),
      ),
    );
  }
}

class _PlaceNameWidget extends StatelessWidget {
  const _PlaceNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.025,
        top: height * 0.01,
      ),
      child: const Center(
        child: Text(
          'Wiktor Zając',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _ShortBioWidget extends StatelessWidget {
  const _ShortBioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.025,
        vertical: height * 0.01,
      ),
      child: const Text(
        'Big fan of nature and unknown places!',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 11,
        ),
      ),
    );
  }
}

class _JourneysMade extends StatelessWidget {
  const _JourneysMade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.025,
        bottom: height * 0.01,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.directions_walk,
            size: 15,
            color: lightGreenColor,
          ),
          Text(
            'Journeys made: ',
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 12,
            ),
          ),
          const Text(
            '13',
            style: TextStyle(
              color: lightGreenColor,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
