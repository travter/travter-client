import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/authentication/sign_in_form/sign_in_form_bloc.dart';
import '../../../../l10n/l10n.dart';
import '../../../core/constants/constant_dimensions.dart';


class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width * socialLoginButtonsWidth,
      height: _size.height * loginButtonsHeight,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(buttonsRadius),
      ),
      alignment: Alignment.center,
      child: InkWell(
        onTap:  () {
          context.read<SignInFormBloc>().add(
            const SignInFormEvent.signInWithGooglePressed(),
          );
        },
        child: Text(
          '',
          // context.l10n.login_with_google,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
