import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/user/user_bloc.dart';
import '../../../router/router.gr.dart';
import '../../constants/constant_colors.dart';
import '../../constants/constant_strings.dart';
import '../../extensions.dart';

const _assetPath = 'assets/images';

class PersonCardClickableWidget extends StatelessWidget {
  const PersonCardClickableWidget(this._user, {Key? key}) : super(key: key);

  final User _user;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if(state.currentlyLookedUpUser == _user) {
          context.router.push(const PersonRoute());
        }
      },
      child: Padding(
        padding: EdgeInsets.only(right: width * 0.05),
        child: InkWell(
          onTap: () {
            context
                .read<UserBloc>()
                .add(UserEvent.currentlyLookedUpUserSet(_user));
          },
          child: Container(
            width: width * 0.425,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ImageWidget(_user),
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.025,
                    top: height * 0.01,
                  ),
                  child: Center(
                    child: Text(
                      _user.username,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.025,
                    vertical: height * 0.01,
                  ),
                  child: Text(
                    _user.bio.length > 15
                        ? '${_user.bio.substring(0, 15)}...'
                        : _user.bio,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),
                ),
                Padding(
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
                      Text(
                        '${_user.posts.length}',
                        style: const TextStyle(
                          color: lightGreenColor,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget(this.user, {Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.015),
      child: Center(
        child: FutureBuilder(
          future: context.read<DataRepository>().getUserProfilePictureUrl(
            user.profilePicture,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final result = snapshot.data as RequestResult<String>;
              return result.fold(
                    (_) =>
                const CircleAvatar(
                  backgroundImage: AssetImage(defaultAvatarPath),
                ),
                    (url) =>
                    CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) =>
                          CircleAvatar(
                            backgroundImage: imageProvider,
                          ),
                    ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
