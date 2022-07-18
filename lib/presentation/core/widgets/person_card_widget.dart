import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';

class PersonCardWidget extends StatelessWidget {
  const PersonCardWidget(this._user, {Key? key}) : super(key: key);

  final User _user;

  @override
  Widget build(BuildContext context) {
    return Text(
      _user.firstName,
    );
  }
}
