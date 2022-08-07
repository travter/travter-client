import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:functionalities_repository/functionalities_repository.dart';

import '../../../application/edit_profile/edit_profile_bloc.dart';
import '../../router/router.gr.dart';

class CompleteProfilePage extends StatelessWidget{
  const CompleteProfilePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
    return Column(
      children: const [
        InkWell(
          child: Text('CompleteProfilePageView'),
        ),
        Expanded(
          child: AutoRouter(),
        ),
      ],
    );
  }
}
