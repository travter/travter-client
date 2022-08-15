import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/edit_profile/edit_profile_bloc.dart';

class EditLastNameFieldWidget extends StatelessWidget {
  const EditLastNameFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        hintText: 'Last Name',
      ),
      onChanged: (value) => context.read<EditProfileBloc>().add(
        EditProfileEvent.lastNameChanged(value),
      ),
    );
  }
}
