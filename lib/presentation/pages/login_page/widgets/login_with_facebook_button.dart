import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_button/sign_button.dart';

import '../../../../application/user/sign_in_form/sign_in_form_bloc.dart';

class LoginWithFacebookButton extends StatelessWidget {
  const LoginWithFacebookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton.mini(
      buttonType: ButtonType.facebook,
      onPressed: () {
        context.read<SignInFormBloc>().add(
              const SignInFormEvent.signInWithFacebookPressed(),
            );
      },
    );
  }
}
