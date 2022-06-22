import 'package:auto_route/annotations.dart';


import '../pages/pages.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    MaterialRoute<LoadingPage>(page: LoadingPage, initial: true),
    MaterialRoute<LoginPage>(page: LoginPage),
    MaterialRoute<HomePage>(page: HomePage),
    MaterialRoute<ProfilePage>(page: ProfilePage)
  ],
)

/// AppRouter class that will be generated with [auto_route](https://pub.dev/packages/auto_route),
/// based on [MaterialAutoRouter].
class $AppRouter {}
