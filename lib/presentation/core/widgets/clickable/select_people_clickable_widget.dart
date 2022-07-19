import 'package:auth_repository/auth_repository.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:data_repository/data_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/collaborative_journey/collaborative_journey_form/collaborative_journey_form_bloc.dart';
import '../../../../application/user/user_bloc.dart';
import '../../extensions.dart';

class SelectPeopleClickableWidget extends StatefulWidget {
  const SelectPeopleClickableWidget({Key? key}) : super(key: key);

  @override
  State<SelectPeopleClickableWidget> createState() =>
      _SelectPeopleClickableWidgetState();
}

class _SelectPeopleClickableWidgetState
    extends State<SelectPeopleClickableWidget> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void didChangeDependencies() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
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
          //animation: animation,
          ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Animation<double>>('animation', animation))
      ..add(DiagnosticsProperty<AnimationController>('controller', controller));
  }
}

//class _SelectPeopleWidgetView extends AnimatedWidget {
//  const _SelectPeopleWidgetView({required Animation<double> animation})
//     : super(listenable: animation);
class _SelectPeopleWidgetView extends StatefulWidget {
  const _SelectPeopleWidgetView({Key? key}) : super(key: key);

  @override
  State<_SelectPeopleWidgetView> createState() =>
      _SelectPeopleWidgetViewState();
}

class _SelectPeopleWidgetViewState extends State<_SelectPeopleWidgetView> {
  @override
  Widget build(BuildContext context) {
    final width = context.dims.width;
    final height = context.dims.height;

    return FutureBuilder<Either<RequestFailure, List<User>>>(
      future: context.read<DataRepository>().fetchUsersFriends(
            context.read<UserBloc>().state.user.friends,
          ),
      builder: (context, snapshot) {
        List<Widget> children = [];
        snapshot.data?.fold((_) {
          children = <Widget>[const Text('Niestety dupa')];
        }, (users) {
          children = <Widget>[
            Container(
              height: height * 0.8, //animation.value,
              width: width, //animation.value,
              color: Colors.green,
              child: Column(
                children: [
                  for (final user in users) Text('ESSSSSA ${user.username}'),
                ],
              ),
            )
          ];
        });
        return Column(
          children: children,
        );
      },
    );
  }
}
