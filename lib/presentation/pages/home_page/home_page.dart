import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/authentication/authentication_bloc.dart';
import '../../router/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => context.router.push(const ProfileRoute()),
            child: const Text('Profile Page'),
          ),
          InkWell(
            onTap: () {
              context.read<AuthenticationBloc>().add(
                    const AuthenticationEvent.signedOut(),
                  );
              context.router.popAndPush(
                const LoginRoute(),
              );
            },
            child: Text(''),//context.l10n.sign_out),
          )
        ],
      ),
    );
  }
}
