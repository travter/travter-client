import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/extensions.dart';

const _assetPath = 'assets/images';

class PopularPlaceCardWidget extends StatelessWidget {
  const PopularPlaceCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;

    return Container(
      width: width * 0.425,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: const [
              _ImageWidget(),
              _FavoriteIconWidget(),
            ],
          ),
          const _PlaceNameWidget(),
          const _PlaceLocationWidget(),
        ],
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox.fromSize(
          child: Image.asset(
            '$_assetPath/niagara_falls.jpg',
          ),
        ),
      ),
    );
  }
}

class _FavoriteIconWidget extends StatelessWidget {
  const _FavoriteIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.01,
        right: width * 0.025,
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 18,
          ),
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
      child: const Text(
        'Niagara Falls',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class _PlaceLocationWidget extends StatelessWidget {
  const _PlaceLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.025,
        top: height * 0.01,
        bottom: height * 0.01,
      ),
      child: Row(
        children: const [
          Icon(Icons.place_outlined, color: Colors.grey, size: 12),
          Text(
            'Ontario Canada',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
