import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:functionalities_repository/functionalities_repository.dart';

import '../../../application/edit_profile/edit_profile_bloc.dart';
import '../../core/constants/constant_colors.dart';
import '../../core/constants/constant_dimensions.dart';
import '../../core/extensions.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({Key? key}) : super(key: key);

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
          child: const CompleteProfilePageView(),
        ),
      ),
    );
  }
}

class CompleteProfilePageView extends StatelessWidget {
  const CompleteProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.dims.width * homePageHorizontalPadding,
      ),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Text(
              'Complete your profile!',
              style: TextStyle(
                color: lightBlueColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: AutoRouter(),
          ),
        ],
      ),
    );
  }
}
