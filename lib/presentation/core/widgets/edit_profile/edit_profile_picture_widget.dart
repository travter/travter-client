import 'package:flutter/material.dart';

import '../../constants/constant_colors.dart';
import '../../extensions.dart';

class EditProfilePictureWidget extends StatelessWidget {
  const EditProfilePictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: context.dims.height * 0.175,
          width: context.dims.width * 0.25,
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/default_avatar.jpeg'),
            radius: 35,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: lightBlueColor,
            shape: BoxShape.circle,
          ),
          child: const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.edit,
              size: 18,
            ),
          ),
        )
      ],
    );
  }
}
