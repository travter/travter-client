import 'package:auto_route/annotations.dart';

import '../pages/home_page/home_page.dart';
import '../pages/loading_page/loading_page.dart';
import '../pages/login_page/login_page.dart';
import '../pages/profile_page/profile_page.dart';

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
