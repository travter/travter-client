import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/user/user_bloc.dart';
import '../../../core/constants/constant_strings.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return FutureBuilder(
          future: context.read<DataRepository>().getUserProfilePictureUrl(
                context.read<UserBloc>().state.user.profilePicture,
              ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final result = snapshot.data as RequestResult<String>;
              return result.fold(
                (_) => const CircleAvatar(
                  backgroundImage: AssetImage(defaultAvatarPath),
                ),
                (url) => CachedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    backgroundImage: imageProvider,
                  ),
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        );
      },
    );
  }
}
