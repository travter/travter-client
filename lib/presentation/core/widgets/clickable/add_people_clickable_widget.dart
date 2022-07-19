import 'package:flutter/material.dart';

import '../../extensions.dart';

class AddPeopleClickableWidget extends StatelessWidget {
  const AddPeopleClickableWidget(this._text, {Key? key}) : super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.dims.width;

    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          const Icon(
            Icons.add_circle_outline,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.015,
            ),
            child: Text(
              _text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
