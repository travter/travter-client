import 'package:auto_route/annotations.dart';

import '../pages/complete_profile/complete_profile.dart';
import '../pages/complete_profile/complete_profile_page.dart';
import '../pages/pages.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute<LoadingPage>(page: LoadingPage, initial: true),
    AutoRoute<LoginPage>(page: LoginPage),
    AutoRoute<HomePage>(page: HomePage),
    AutoRoute<ProfilePage>(page: ProfilePage),
    AutoRoute<SettingsPage>(page: SettingsPage),
    AutoRoute<CommunityGuidelinesPage>(page: CommunityGuidelinesPage),
    AutoRoute<PrivacyPolicyPage>(page: PrivacyPolicyPage),
    AutoRoute<TermsOfServicePage>(page: TermsOfServicePage),
    AutoRoute<EditProfilePage>(page: EditProfilePage),
    AutoRoute<AddJourneyPage>(page: AddJourneyPage),
    AutoRoute<SearchPage>(page: SearchPage),
    AutoRoute<AddCalculationPage>(page: AddCalculationPage),
    AutoRoute<CalculationPage>(page: CalculationPage),
    AutoRoute<CalculationsPage>(page: CalculationsPage),
    AutoRoute<FavoriteEntriesPage>(page: FavoriteEntriesPage),
    AutoRoute<FavoritePostsPage>(page: FavoritePostsPage),
    AutoRoute<FavoritePlacesPage>(page: FavoritePlacesPage),
    AutoRoute<EditJourneyPage>(page: EditJourneyPage),
    AutoRoute<JourneyPage>(page: JourneyPage),
    AutoRoute<AddJourneyInfoPage>(page: AddJourneyInfoPage),
    AutoRoute<PopularPlacePage>(page: PopularPlacePage),
    AutoRoute<AddCollaborativeJourneyPage>(page: AddCollaborativeJourneyPage),
    AutoRoute<PeoplePage>(page: PeoplePage),
    AutoRoute<PersonPage>(page: PersonPage),
    AutoRoute<CompleteProfilePage>(
      page: CompleteProfilePage,
      children: [
        AutoRoute<NameAndUsernamePage>(
          page: NameAndUsernamePage,
          initial: true,
        ),
        AutoRoute<ImageAndBioPage>(page: ImageAndBioPage),
      ],
    ),
  ],
)
class $AppRouter {}
