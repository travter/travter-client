import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'application/bloc_observer.dart';
import 'injection.dart' as di;
import 'presentation/core/my_app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  di.configureInjection(Environment.dev);
  await di.init();
  BlocOverrides.runZoned(
    () {
      runApp(MyAppWidget());
    },
    blocObserver: SimpleBlocObserver(),
  );
}
