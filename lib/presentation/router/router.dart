import 'package:auto_route/annotations.dart';

import '../pages/home_page/pages/popular_people_page/popular_people_page.dart';
import '../pages/home_page/pages/popular_places_page/popular_places_page.dart';
import '../pages/pages.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    MaterialRoute<LoadingPage>(page: LoadingPage, initial: true),
    MaterialRoute<LoginPage>(page: LoginPage),
    MaterialRoute<HomePage>(page: HomePage),
    MaterialRoute<ProfilePage>(page: ProfilePage),
    MaterialRoute<SettingsPage>(page: SettingsPage),
    MaterialRoute<CommunityGuidelinesPage>(page: CommunityGuidelinesPage),
    MaterialRoute<PrivacyPolicyPage>(page: PrivacyPolicyPage),
    MaterialRoute<TermsOfServicePage>(page: TermsOfServicePage),
    MaterialRoute<EditProfilePage>(page: EditProfilePage),
    MaterialRoute<AddJourneyPage>(page: AddJourneyPage),
    MaterialRoute<SearchPage>(page: SearchPage),
    MaterialRoute<AddCalculationPage>(page: AddCalculationPage),
    MaterialRoute<CalculationPage>(page: CalculationPage),
    MaterialRoute<CalculationsPage>(page: CalculationsPage),
    MaterialRoute<FavoriteEntriesPage>(page: FavoriteEntriesPage),
    MaterialRoute<FavoritePostsPage>(page: FavoritePostsPage),
    MaterialRoute<FavoritePlacesPage>(page: FavoritePlacesPage),
    MaterialRoute<EditJourneyPage>(page: EditJourneyPage),
    MaterialRoute<JourneyPage>(page: JourneyPage),
    MaterialRoute<AddJourneyInfoPage>(page: AddJourneyInfoPage),
    MaterialRoute<PopularPeoplePage>(page: PopularPeoplePage),
    MaterialRoute<PopularPlacesPage>(page: PopularPlacesPage),
    MaterialRoute<AddCollaborativeJourneyPage>(
        page: AddCollaborativeJourneyPage),
  ],
)

class $AppRouter {}
