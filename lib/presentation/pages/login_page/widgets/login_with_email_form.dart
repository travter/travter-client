import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/authentication/sign_in_form/sign_in_form_bloc.dart';
import '../../../../infrastructure/core/constants/enums.dart';
import '../../../core/extensions.dart';
import 'authenticate_with_email_button.dart';

class LoginWithEmailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authResult.fold(
          () {},
          (either) => either.fold(
            (failure) {
              FlushbarHelper.createError(
                message: failure.map(
                  cancelledByUser: (_) => 'Cancelled',
                  serverError: (_) => 'Server error',
                  emailAlreadyInUse: (_) => 'Email already in use',
                  invalidEmailOrPassword: (_) =>
                      'Invalid email and password combination',
                ),
              ).show(context);
            },
            (_) {},
          ),
        );
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.dims.width * 0.05,
          ),
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: context.dims.height * 0.05,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      hintText: 'Email',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => context.read<SignInFormBloc>().add(
                          SignInFormEvent.emailChanged(value),
                        ),
                    validator: (_) =>
                        context.read<SignInFormBloc>().state.email.value.fold(
                              (l) => l.maybeMap(
                                invalidEmail: (_) => 'Invalid email',
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.white.withOpacity(0.75),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autocorrect: false,
                  obscureText: true,
                  onChanged: (value) => context.read<SignInFormBloc>().add(
                        SignInFormEvent.passwordChanged(value),
                      ),
                  validator: (_) =>
                      context.read<SignInFormBloc>().state.password.value.fold(
                            (l) => l.maybeMap(
                              invalidPassword: (_) => 'Invalid password',
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: context.dims.height * 0.075,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      AuthenticateWithEmailButton(
                        authOption: AuthenticationOption.login,
                      ),
                      AuthenticateWithEmailButton(
                        authOption: AuthenticationOption.register,
                      ),
                    ],
                  ),
                ),
                if (state.isSubmitting) ...[
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
