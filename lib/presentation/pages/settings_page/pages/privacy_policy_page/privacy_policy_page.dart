import 'package:flutter/material.dart';

import '../info_page_widget.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InfoPageWidget(header: 'Privacy Policy', text: _lorem);
  }
}

const _lorem =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pretium euismod turpis, sed placerat ante venenatis a. Nam condimentum facilisis eleifend. Vestibulum lacinia, ligula vitae accumsan faucibus, risus urna volutpat ex, id accumsan lacus mi vitae erat. Proin vulputate, eros sed rhoncus feugiat, mi tortor fringilla metus, in dapibus nisi felis ac lectus. Donec ultrices, odio eu eleifend dapibus, lorem ipsum efficitur massa, id consequat magna ligula et nunc. Pellentesque sagittis ultrices mauris sed fringilla. Sed ac mi viverra, fermentum nisi eu, luctus felis. Fusce rhoncus laoreet risus, at mollis ipsum blandit at. Donec condimentum finibus interdum. Suspendisse potenti. Quisque scelerisque luctus sollicitudin. Suspendisse condimentum viverra ipsum, vel feugiat ipsum iaculis vitae. Sed ligula metus, venenatis eget ligula vel, sollicitudin dignissim ex. Aliquam sit amet diam dolor.';
