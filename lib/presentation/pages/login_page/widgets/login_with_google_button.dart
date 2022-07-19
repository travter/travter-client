import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_button/sign_button.dart';

import '../../../../application/user/sign_in_form/sign_in_form_bloc.dart';



class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return  SignInButton.mini(
      buttonType: ButtonType.google,
      onPressed: () {
        context.read<SignInFormBloc>().add(
          const SignInFormEvent.signInWithGooglePressed(),
        );
      },
    );
  }
}
