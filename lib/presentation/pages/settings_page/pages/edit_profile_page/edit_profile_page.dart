import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:functionalities_repository/functionalities_repository.dart';

import '../../../../../application/edit_profile/edit_profile_bloc.dart';
import '../../../../core/constants/constant_colors.dart';
import '../../../../core/constants/constant_dimensions.dart';
import '../../../../core/extensions.dart';

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
        // TODO: implement listener
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
                        EditProfileEvent.usernameChanged(value),
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
