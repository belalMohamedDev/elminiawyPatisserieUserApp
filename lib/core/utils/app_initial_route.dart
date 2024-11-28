import '../../../../../core/common/shared/shared_imports.dart'; //

class AppInitialRoute {
  factory AppInitialRoute() {
    return _instance;
  }

  AppInitialRoute._();

  static final AppInitialRoute _instance = AppInitialRoute._();

  static bool isLoggedInUser = false;
  static bool isOnBoardingScreen = false;
  static bool isAnonymousUser = false;
  static bool isLocatedMap = false;
  static String role = "";

  getStoreDataAndCheckInitialRoute() async {
    var results = await Future.wait([
      SharedPrefHelper.getSecuredString(PrefKeys.refreshToken),
      SharedPrefHelper.getSecuredString(PrefKeys.enLocationArea),
      SharedPrefHelper.getSecuredString(PrefKeys.role),
    ]);

    bool? isOnBoardingScreenView =
        SharedPrefHelper.getBool(PrefKeys.prefsKeyOnBoardingScreenView);
    bool? isAnonymousUserlogic =
        SharedPrefHelper.getBool(PrefKeys.prefsKeyAnonymousUser);

    String? userToken = results[0] as String?;

    String? locationArea = results[1] as String?;

    String? authRole = results[2] as String?;

    if (!userToken.isNullOrEmpty()) {
      isLoggedInUser = true;
    } else {
      isLoggedInUser = false;
    }

    if (isOnBoardingScreenView == true) {
      isOnBoardingScreen = true;
    }

    if (isAnonymousUserlogic == true) {
      isAnonymousUser = true;
    }

    if (!locationArea.isNullOrEmpty()) {
      isLocatedMap = true;
    } else {
      isLocatedMap = false;
    }

    if (!authRole.isNullOrEmpty()) {
      role = authRole!;
    } else {
      role = "";
    }
  }
}
