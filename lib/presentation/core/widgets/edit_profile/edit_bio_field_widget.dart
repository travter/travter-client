import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/edit_profile/edit_profile_bloc.dart';

class EditBioFieldWidget extends StatelessWidget {
  const EditBioFieldWidget({Key? key}) : super(key: key);

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
        hintText: 'Bio',
      ),
      onChanged: (value) => context.read<EditProfileBloc>().add(
        EditProfileEvent.bioChanged(value),
      ),
    );
  }
}
