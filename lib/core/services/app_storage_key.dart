bool isLoggedInUser = false;
bool isOnBoardingScreen = false;
bool isAnonymousUser = false;
bool isLocatedMap = false;


class PrefKeys {
  static const String prefsKeyIsUserLoggedIn = 'PREFS_KEY_IS_USER_LOGGED_IN';
  static const String prefsKeyOnBoardingScreenView =
      'PREFS_KEY_ONBOARD_SCREEN_VIEW';
  static const String userAccessToken = 'USER_ACCESS_TOKEN';
  static const String userRefreshToken = 'USER_REFRESH_TOKEN';
  static const String userName = 'USER_NAME';
  static const String userEmail = 'USER_EMAIL';
  static const String userId = 'USER_ID';
  static const String userPhone = 'USER_PHONE';
  static const String refreshToken = 'refreshToken';
  static const String accessToken = 'accessToken';
  static const String locationArea = 'locationArea';
  static const String latAddressHome = 'latAddressHome';
  static const String longAddressHome = 'longAddressHome';
  static const String prefsKeyAnonymousUser = 'prefsKeyAnonymousUser';
  static const String prefsSetLoginMap = 'prefsSetLoginMap';
}
