import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/bloc_observer.dart';
import 'firebase_options.dart';
import 'injection.dart' as di;
import 'presentation/core/my_app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  di.setup();

  BlocOverrides.runZoned(
    () {
      runApp(MyAppWidget());
    },
    blocObserver: SimpleBlocObserver(),
  );
}
