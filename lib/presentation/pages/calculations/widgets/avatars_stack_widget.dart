import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constant_colors.dart';
import '../../../core/extensions.dart';

class AvatarsStackWidget extends StatelessWidget {
  const AvatarsStackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    return Align(
      alignment: Alignment.bottomRight,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.15),
            child: const _CircleAvatarWidget('assets/images/brad_pitt.jpeg'),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.075),
            child:
                const _CircleAvatarWidget('assets/images/julie_roberts.jpeg'),
          ),
          const _CircleAvatarWidget('assets/images/profile_picture.jpeg')
        ],
      ),
    );
  }
}

class _CircleAvatarWidget extends StatelessWidget {
  const _CircleAvatarWidget(this.assetPath, {Key? key}) : super(key: key);

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: lightGreenColor,
      child: CircleAvatar(
        radius: 15,
        backgroundImage: AssetImage(
          assetPath,
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('assetPath', assetPath));
  }
}
