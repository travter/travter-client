import 'package:auth_repository/auth_repository.dart';
import 'package:data_repository/data_repository.dart';
import 'package:functionalities_repository/functionalities_repository.dart';
import 'package:get_it/get_it.dart';

import 'application/search/search_bloc.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerSingleton<DataRepository>(DataRepository())
    ..registerSingleton<AuthenticationRepository>(AuthenticationRepository())
    ..registerSingleton<FunctionalitiesRepository>(FunctionalitiesRepository())
    ..registerSingleton<SearchBloc>(SearchBloc(getIt<DataRepository>()));
}
