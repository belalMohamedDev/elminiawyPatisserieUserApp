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

  //set login screen data
  Future<void> setLoginScreenData({
    required String userToken,
    required String userName,
    required String userPhone,
    required String userEmail,
  }) async {
    await _sharedPreferences.setString(PrefKeys.userToken, userToken);
    await _sharedPreferences.setString(PrefKeys.userName, userName);
    await _sharedPreferences.setString(PrefKeys.userPhone, userPhone);
    await _sharedPreferences.setString(PrefKeys.userEmail, userEmail);
  }

//user token
 
  String isAccessToken() {
    return  _sharedPreferences.getString(PrefKeys.userToken) ?? "";
  }
}
