import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/authentication/sign_in_form/sign_in_form_bloc.dart';
import '../../../../infrastructure/core/constants/enums.dart';
import '../../../../infrastructure/core/constants/extensions.dart';
import '../../../../l10n/l10n.dart';
import '../../../core/constants/constant_dimensions.dart';


class AuthenticateWithEmailButton extends StatelessWidget {
  const AuthenticateWithEmailButton({
    required this.authOption,
    Key? key,
  }) : super(key: key);

  final AuthenticationOption authOption;

  void _onPressed(BuildContext context) {
    if (authOption == AuthenticationOption.login) {
      context.read<SignInFormBloc>().add(
            const SignInFormEvent.signInWithEmailAndPasswordPressed(),
          );
      return;
    }
    context.read<SignInFormBloc>().add(
          const SignInFormEvent.registerWithEmailAndPasswordPressed(),
        );
  }

  @override
  Widget build(BuildContext context) {
    var _text = ''; //context.l10n.register_with_email;
    if (authOption == AuthenticationOption.login) {
      // _text = context.l10n.login_with_email;
    }

    return InkWell(
      onTap: () => _onPressed(context),
      child: Container(
        width: context.mediaSize.width * 0.35,
        height: context.mediaSize.height * loginButtonsHeight,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          _text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(EnumProperty<AuthenticationOption>('authOption', authOption));
  }
}
