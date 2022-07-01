import 'package:auth_repository/auth_repository.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../application/authentication/authentication_bloc.dart';
import '../../application/expenses_tracker/expenses_tracker_bloc.dart';
import '../../injection.dart';
import '../router/router.gr.dart';

/// Main application that is on the top of widget tree,
/// contains most essential properties and configuration.
class MyAppWidget extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthenticationBloc(
            getIt<AuthenticationRepository>(),
          )..add(
              const AuthenticationEvent.authCheckRequested(),
            ),
        ),
        BlocProvider(
          create: (_) => ExpensesTrackerBloc(
            getIt<DataRepository>(),
            getIt<AuthenticationRepository>(),
          )..add(const ExpensesTrackerEvent.fetchTrackersRequested()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Traveler',
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('pl', ''),
        ],
      ),
    );
  }
}
