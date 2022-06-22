import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/authentication/sign_in_form/sign_in_form_bloc.dart';
import '../../../injection.dart';
import '../../router/router.gr.dart';
import 'widgets/login_with_email_form.dart';
import 'widgets/login_with_facebook_button.dart';
import 'widgets/login_with_google_button.dart';
import 'widgets/logo_icon.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInFormBloc(getIt<AuthenticationRepository>()),
      child: BlocListener<SignInFormBloc, SignInFormState>(
        listener: (context, state) {
          state.authResult.fold(
            () => null,
            (result) => result.fold(
              (_) => () => null,
              (_) {
                context.router.popAndPush(const HomeRoute());
              },
            ),
          );
        },
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login_background.jpg'),
                fit: BoxFit.cover,
              )
            ),
            child: Column(
              children: [
                const LogoIcon(),
                LoginWithEmailForm(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    LoginWithFacebookButton(),
                    LoginWithGoogleButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
