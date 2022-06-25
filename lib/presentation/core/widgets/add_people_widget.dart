import 'package:flutter/material.dart';

import '../extensions.dart';

class AddPeopleWidget extends StatelessWidget {
  const AddPeopleWidget(this._text, {Key? key}) : super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;

    return Row(
      children: [
        const Icon(
          Icons.add_circle_outline,
          color: Colors.white,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.015,
          ),
          child: Text(
            _text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
