import 'package:shared_preferences/shared_preferences.dart';

import 'app_storage_key.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  //on Boarding screen
  Future<void> setOnBoardingScreenView() async {
    await _sharedPreferences.setBool(
        PrefKeys.prefsKeyOnBoardingScreenView, true);
  }

  Future<bool> isOnBoardingScreenView() async {
    return _sharedPreferences.getBool(PrefKeys.prefsKeyOnBoardingScreenView) ??
        false;
  }

  //login screen data

  Future<void> setLoginScreenView() async {
    await _sharedPreferences.setBool(PrefKeys.prefsKeyIsUserLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PrefKeys.prefsKeyIsUserLoggedIn) ?? false;
  }

  //set auth  data
  Future<void> setAuthData({
    required String accessToken,
    required String userName,
    required String userPhone,
    required String userEmail,
    required String refreshToken,
  }) async {
    await _sharedPreferences.setString(PrefKeys.userAccessToken, accessToken);
    await _sharedPreferences.setString(PrefKeys.userName, userName);
    await _sharedPreferences.setString(PrefKeys.userPhone, userPhone);
    await _sharedPreferences.setString(PrefKeys.userEmail, userEmail);
    await _sharedPreferences.setString(PrefKeys.userRefreshToken, refreshToken);
  }

//user token

  String isAccessToken() {
    return _sharedPreferences.getString(PrefKeys.userAccessToken) ?? "";
  }

  String isRefreshToken() {
    return _sharedPreferences.getString(PrefKeys.userRefreshToken) ?? "";
  }
}
