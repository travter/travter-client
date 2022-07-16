import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/authentication/authentication_bloc.dart';
import '../../router/router.gr.dart';

/// Widget that is displayed during any loading action,
/// like fetching data or checking connection.
class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.maybeMap(
          authenticated: (_) {
            context.router.push(const HomeRoute());
            context.router.popUntilRouteWithName('HomeRoute');
          },
          unauthenticated: (_) {
            context.router.popAndPush(const LoginRoute());
            context.router.popUntilRouteWithName('LoginRoute');
          },
          orElse: () {},
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
