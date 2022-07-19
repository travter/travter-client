import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/journey/journey_bloc.dart';
import '../../../../../application/user/user_bloc.dart';
import '../../../../core/constants/constant_colors.dart';
import '../../../../core/constants/constant_dimensions.dart';
import '../../../../core/extensions.dart';
import 'section_header_text_widget.dart';
import 'visited_places_widget.dart';

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
        decoration: const BoxDecoration(
          color: lightPrimaryColor,
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
                  children: const [
                    _JourneyTitleWidget(),
                    _AuthorSectionWidget(),
                  ],
                ),
                const _FavoriteIconWidget(),
              ],
            ),
            SizedBox(
              height: height * 0.025,
            ),
            const SectionHeaderTextWidget('Visited Places'),
            const VisitedPlacesWidget(),
            SizedBox(
              height: height * 0.025,
            ),
            const SectionHeaderTextWidget('Description'),
            const _JourneyDescriptionWidget(),
          ],
        ),
      ),
    );
  }
}

const _lorem =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pretium euismod turpis, sed placerat ante venenatis a. Nam condimentum facilisis eleifend. Vestibulum lacinia, ligula vitae accumsan faucibus, risus urna volutpat ex, id accumsan lacus mi vitae erat. Proin vulputate, eros sed rhoncus feugiat, mi tortor fringilla metus, in dapibus nisi felis ac lectus. Donec ultrices, odio eu eleifend dapibus, lorem ipsum efficitur massa, id consequat magna ligula et nunc. Pellentesque sagittis ultrices mauris sed fringilla. Sed ac mi viverra, fermentum nisi eu, luctus felis. Fusce rhoncus laoreet risus, at mollis ipsum blandit at. Donec condimentum finibus interdum. Suspendisse potenti. Quisque scelerisque luctus sollicitudin. Suspendisse condimentum viverra ipsum, vel feugiat ipsum iaculis vitae. Sed ligula metus, venenatis eget ligula vel, sollicitudin dignissim ex. Aliquam sit amet diam dolor.';

class _JourneyTitleWidget extends StatelessWidget {
  const _JourneyTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.015),
      child: BlocBuilder<JourneyBloc, JourneyState>(
        builder: (context, state) {
          return Text(
            state.currentlyLookedUpJourney!.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          );
        },
      ),
    );
  }
}

class _AuthorSectionWidget extends StatelessWidget {
  const _AuthorSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;

    return Row(
      children: [
        const CircleAvatar(
          radius: 13,
          backgroundImage: AssetImage('assets/images/profile_picture.jpeg'),
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
    );
  }
}

class _FavoriteIconWidget extends StatelessWidget {
  const _FavoriteIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    final authBloc = context.watch<UserBloc>();
    final journeyBloc = context.read<JourneyBloc>();
    final usersLikedPosts = authBloc.state.user.likedPostsIds;
    final currentPostId = journeyBloc.state.currentlyLookedUpJourney!.id;
    var isThisPostLiked = false;

    for (final id in usersLikedPosts) {
      if (id == currentPostId) {
        isThisPostLiked = true;
      }
    }

    return InkWell(
      onTap: () => authBloc.add(UserEvent.journeyLikeToggled(currentPostId)),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.015, vertical: height * 0.015),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: primaryColor,
        ),
        child: Icon(
          isThisPostLiked ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
          size: 18,
        ),
      ),
    );
  }
}

class _JourneyDescriptionWidget extends StatelessWidget {
  const _JourneyDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      _lorem,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 13,
        height: 1.5,
      ),
    );
  }
}
