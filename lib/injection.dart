import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

/// [GetIt] instance required for [injectable] configuration.
GetIt getIt = GetIt.instance;

/// Default [injectable] configuration, marked with
/// [injectableInit] for code generation.
@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}

/// Function that inits injection when App starts.
///
/// It may be confusing, because running a command `flutter pub run build_runner watch/build`
/// may result in failing and return an error message informing about those type
/// being unregistered. In order to fix this, just run the application first.
Future<void> init() async {}
