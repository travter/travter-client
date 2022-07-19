import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/collaborative_journey/collaborative_journey_form/collaborative_journey_form_bloc.dart';
import '../extensions.dart';

class SelectPeopleWidget extends StatefulWidget {
  const SelectPeopleWidget({Key? key}) : super(key: key);

  @override
  State<SelectPeopleWidget> createState() => _SelectPeopleWidgetState();
}

class _SelectPeopleWidgetState extends State<SelectPeopleWidget>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void didChangeDependencies() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween<double>(begin: 0, end: 1)
        .animate(controller);
    controller.forward();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<CollaborativeJourneyFormBloc>().add(
            const CollaborativeJourneyFormEvent.addPeopleFinished(),
          ),
      child: _SelectPeopleWidgetView(
        animation: animation,
      ),
    );
  }
}

class _SelectPeopleWidgetView extends AnimatedWidget {
  const _SelectPeopleWidgetView(
      {super.key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    final animation = listenable as Animation<double>;

    return Container(
        height: height * animation.value,
        width: width * animation.value,
        color: Colors.green,
    );
  }
}
