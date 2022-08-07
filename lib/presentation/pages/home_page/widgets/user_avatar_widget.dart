import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/user/user_bloc.dart';
import '../../../core/constants/constant_strings.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({required this.radius, Key? key}) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.user.profilePicture.isNotEmpty) {
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
        }
        return CircleAvatar(
          backgroundImage: const AssetImage(defaultAvatarPath),
          radius: radius,
        );
      },
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('radius', radius));
  }
}
