import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:functionalities_repository/functionalities_repository.dart';

import '../../../../../application/edit_profile/edit_profile_bloc.dart';
import '../../../../../application/user/user_bloc.dart';
import '../../../../core/constants/constant_colors.dart';
import '../../../../core/constants/constant_dimensions.dart';
import '../../../../core/extensions.dart';
import '../../../../router/router.gr.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: BlocProvider(
          create: (context) => EditProfileBloc(
            context.read<FunctionalitiesRepository>(),
            context.read<DataRepository>(),
            context.read<AuthenticationRepository>(),
          ),
          child: const _EditProfileView(),
        ),
      ),
    );
  }
}

class _EditProfileView extends StatelessWidget {
  const _EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return BlocConsumer<EditProfileBloc, EditProfileState>(
      listener: (context, state) {
        state.editionResult.fold(
          () => null,
          (result) => result.fold(
            (l) => null,
            (_) {
              final authBloc = context.read<UserBloc>();
              final userState = authBloc.state.user;
              // wtf is that plox refactor someday
              final updatedUser = User(
                userState.friends,
                uid: userState.uid,
                username: state.username,
                bio: state.bio,
                profilePicture: state.photoReference,
                firstName: state.firstName,
                lastName: state.lastName,
                followers: userState.followers,
                following: userState.following,
                posts: userState.posts,
                expensesTrackers: userState.expensesTrackers,
                likedPostsIds: userState.likedPostsIds,
              );
              authBloc.add(UserEvent.userStateUpdated(updatedUser));
              context.router.popUntilRouteWithName(const HomeRoute().routeName);
            },
          ),
        );
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * homePageHorizontalPadding,
            ),
            child: Column(
              children: [
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: 'Username',
                  ),
                  onChanged: (value) => context.read<EditProfileBloc>().add(
                        EditProfileEvent.usernameChanged(value),
                      ),
                ),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: 'Bio',
                  ),
                  onChanged: (value) => context.read<EditProfileBloc>().add(
                        EditProfileEvent.bioChanged(value),
                      ),
                ),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: 'First Name',
                  ),
                  onChanged: (value) => context.read<EditProfileBloc>().add(
                    EditProfileEvent.firstNameChanged(value),
                  ),
                ),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: 'Last Name',
                  ),
                  onChanged: (value) => context.read<EditProfileBloc>().add(
                    EditProfileEvent.lastNameChanged(value),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<EditProfileBloc>().add(
                          const EditProfileEvent.profilePhotoSelectionStarted(),
                        );
                  },
                  child: const Text(
                    'Pick profile picture',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => context.read<EditProfileBloc>().add(
                        const EditProfileEvent.submitFormPressed(),
                      ),
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
