import 'package:flutter/material.dart';

import '../../../../core/widgets/edit_profile/edit_first_name_field_widget.dart';
import '../../../../core/widgets/edit_profile/edit_last_name_field_widget.dart';
import '../../../../core/widgets/edit_profile/edit_username_field_widget.dart';

class NameAndUsernamePage extends StatelessWidget {
  const NameAndUsernamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NameAndUsernamePageView();
  }
}

class NameAndUsernamePageView extends StatelessWidget {
  const NameAndUsernamePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('KURWAAAAAA'),
        EditUsernameFieldWidget(),
        EditFirstNameFieldWidget(),
        EditLastNameFieldWidget(),
      ],
    );
  }
}
