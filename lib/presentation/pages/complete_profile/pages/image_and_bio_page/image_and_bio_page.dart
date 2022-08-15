import 'package:flutter/material.dart';

import '../../../../core/widgets/edit_profile/edit_bio_field_widget.dart';
import '../../../../core/widgets/edit_profile/edit_profile_picture_widget.dart';
import 'widgets/finish_editing_button_widget.dart';

class ImageAndBioPage extends StatelessWidget {
  const ImageAndBioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ImageAndBioPageView();
  }
}

class ImageAndBioPageView extends StatelessWidget {
  const ImageAndBioPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
         EditProfilePictureWidget(),
         EditBioFieldWidget(),
         FinishEditingButtonWidget(),
      ],
    );
  }
}
