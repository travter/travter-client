import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/user/user_bloc.dart';
import '../../../core/constants/constant_colors.dart';
import '../../../core/constants/constant_strings.dart';
import '../../../core/extensions.dart';

class PersonProfileSummary extends StatelessWidget {
  const PersonProfileSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: lightPrimaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.04,
          horizontal: width * 0.075,
        ),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Column(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: FutureBuilder(
                    future:
                        context.read<DataRepository>().getUserProfilePictureUrl(
                              state.currentlyLookedUpUser.profilePicture,
                            ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final result = snapshot.data as RequestResult<String>;
                        return result.fold(
                          (_) => const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(defaultAvatarPath),
                          ),
                          (url) => CachedNetworkImage(
                            imageUrl: url,
                            fit: BoxFit.cover,
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              radius: 30,
                              backgroundImage: imageProvider,
                            ),
                          ),
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Text(
                    '${state.currentlyLookedUpUser.firstName} ${state.currentlyLookedUpUser.lastName}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Text(
                    state.currentlyLookedUpUser.bio,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      wordSpacing: 2,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  height: height * 0.015,
                  color: lightPrimaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${state.currentlyLookedUpUser.following.length} following',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.025),
                      child: Text(
                        '${state.currentlyLookedUpUser.followers.length} followers',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
