import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constant_colors.dart';
import 'widgets/person_profile_summary.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({required this.person, Key? key}) : super(key: key);

  final User person;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightPrimaryColor,
        body: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  PersonProfileSummary(person),
                  ElevatedButton(onPressed: () {}, child: const Text('Follow')),
                  ElevatedButton(onPressed: () {}, child: const Text('Add to friends')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<User>('person', person));
  }
}