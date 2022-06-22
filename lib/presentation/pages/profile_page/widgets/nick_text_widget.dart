import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions.dart';
import '../../../router/router.gr.dart';

class NickTextWidget extends StatelessWidget {
  const NickTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;

    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.05,
        bottom: height * 0.025,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _GoBackWidget(),
          _UserNickWidget(),
          _OptionsWidget(),
        ],
      ),
    );
  }
}

class _GoBackWidget extends StatelessWidget {
  const _GoBackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    return InkWell(
      onTap: () => context.router.pop(),
      child: Container(
        width: width * (1 / 3),
        padding: EdgeInsets.only(left: width * 0.025),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white.withOpacity(0.9),
            ),
            const Text(
              'Back',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserNickWidget extends StatelessWidget {
  const _UserNickWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dims.width * (1 / 3),
      child: Center(
        child: Text(
          'Creatix',
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}

class _OptionsWidget extends StatelessWidget {
  const _OptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    return InkWell(
      onTap: () => context.router.push(const SettingsRoute()),
      child: Container(
        width: width * (1 / 3),
        child: Padding(
          padding: EdgeInsets.only(right: width * 0.025),
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.more_horiz,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ),
      ),
    );
  }
}
