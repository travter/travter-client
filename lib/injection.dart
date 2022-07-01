import 'package:auth_repository/auth_repository.dart';
import 'package:data_repository/data_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'application/collaborative_journey/collaborative_journey_form/collaborative_journey_form_bloc.dart';
import 'application/expenses_tracker/expenses_tracker_bloc.dart';
import 'application/expenses_tracker/expenses_tracker_form/expenses_tracker_form_bloc.dart';
import 'application/journey/journey_form/journey_form_bloc.dart';
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
Future<void> init() async {
  getIt
    ..registerSingleton<AuthenticationRepository>(AuthenticationRepository())
    ..registerSingleton<DataRepository>(DataRepository())
    ..registerSingleton<ExpensesTrackerFormBloc>(
      ExpensesTrackerFormBloc(
        getIt<DataRepository>(),
        getIt<AuthenticationRepository>(),
      ),
    )
    ..registerSingleton<JourneyFormBloc>(
      JourneyFormBloc(
        getIt<AuthenticationRepository>(),
        getIt<DataRepository>(),
      ),
    )
    ..registerSingleton<CollaborativeJourneyFormBloc>(
      CollaborativeJourneyFormBloc(
        getIt<AuthenticationRepository>(),
        getIt<DataRepository>(),
      ),
    )
    ..registerSingleton<ExpensesTrackerBloc>(
      ExpensesTrackerBloc(
        getIt<DataRepository>(),
        getIt<AuthenticationRepository>(),
      )..add(const ExpensesTrackerEvent.fetchTrackersRequested()),
    );
}
