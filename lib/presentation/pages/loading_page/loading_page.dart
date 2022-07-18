import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/user/user_bloc.dart';
import '../../router/router.gr.dart';

/// Widget that is displayed during any loading action,
/// like fetching data or checking connection.
class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        switch (state.authStatus) {
          case AuthenticationStatus.authenticated:
            context.router.push(const HomeRoute());
            context.router.popUntilRouteWithName('HomeRoute');
            break;
          case AuthenticationStatus.unauthenticated:
            context.router.popAndPush(const LoginRoute());
            context.router.popUntilRouteWithName('LoginRoute');
            break;
          case AuthenticationStatus.initial:
            break;
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
