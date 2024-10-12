import '../../../../../core/common/shared/shared_imports.dart'; //

class AppLogin {
  factory AppLogin() {
    return _instance;
  }

  AppLogin._();

  static final AppLogin _instance = AppLogin._();

  Future<void> storeDataThenNavigateToMap(AuthResponse authResponse,
      {bool isChangeUserPassword = false}) async {
    final context = instance<GlobalKey<NavigatorState>>().currentState!.context;

    await SharedPrefHelper.setSecuredString(
        PrefKeys.userPhone, authResponse.data!.phone!);
    await SharedPrefHelper.setSecuredString(
        PrefKeys.userName, authResponse.data!.name!);
    await SharedPrefHelper.setSecuredString(
        PrefKeys.userEmail, authResponse.data!.email!);

    await SharedPrefHelper.setSecuredString(
        PrefKeys.userId, authResponse.data!.sId!);
    await SharedPrefHelper.setSecuredString(
        PrefKeys.accessToken, authResponse.accessToken!);
    await SharedPrefHelper.setSecuredString(
        PrefKeys.refreshToken, authResponse.data!.refreshToken!);

    if (!isChangeUserPassword) {
      SharedPrefHelper.setData(PrefKeys.prefsSetLoginMap, true);
      if (!context.mounted) return;
      context.pushReplacementNamed(Routes.map);
    }
  }
}
