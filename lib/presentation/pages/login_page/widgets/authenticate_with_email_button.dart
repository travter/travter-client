import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/user/sign_in_form/sign_in_form_bloc.dart';
import '../../../../infrastructure/core/constants/enums.dart';
import '../../../core/constants/constant_dimensions.dart';
import '../../../core/extensions.dart';

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
    var _text = context.l10n.register_with_email;
    final isLogin = authOption == AuthenticationOption.login;
    if (isLogin) {
      _text = context.l10n.login_with_email;
    }

    return InkWell(
      onTap: () => _onPressed(context),
      child: Container(
        width: context.dims.width * 0.4,
        height: context.dims.height * loginButtonsHeight,
        decoration: BoxDecoration(
            color: isLogin ? Colors.amber : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: !isLogin ? Colors.amber : Colors.transparent,
              width: 2,
            )),
        alignment: Alignment.center,
        child: Text(
          _text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
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
