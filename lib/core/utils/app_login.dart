import '../../../../../core/common/shared/shared_imports.dart'; //

// Singleton class for handling login-related operations
class AppLogin {
  factory AppLogin() {
    return _instance;
  }

  AppLogin._();

  static final AppLogin _instance = AppLogin._();

  Future<void> storeAuthData(
    AuthResponse authResponse, {
    bool isChangeUserPassword = false,
  }) async {
    final data = authResponse.data;

    if (data == null) return;

    if (data.phone != null) {
      await SharedPrefHelper.setSecuredString(PrefKeys.userPhone, data.phone!);
    }

    if (data.name != null) {
      await SharedPrefHelper.setSecuredString(PrefKeys.userName, data.name!);
    }

    if (data.email != null) {
      await SharedPrefHelper.setSecuredString(PrefKeys.userEmail, data.email!);
    }

    if (data.sId != null) {
      await SharedPrefHelper.setSecuredString(PrefKeys.userId, data.sId!);
    }

    if (authResponse.accessToken != null) {
      await SharedPrefHelper.setSecuredString(
        PrefKeys.accessToken,
        authResponse.accessToken!,
      );
    }

    if (data.refreshToken != null) {
      await SharedPrefHelper.setSecuredString(
        PrefKeys.refreshToken,
        data.refreshToken!,
      );
    }

    if (data.role != null) {
      await SharedPrefHelper.setSecuredString(PrefKeys.role, data.role!);
      AppInitialRoute.role = data.role!;
    }

    if (data.storeAddress?.sId != null) {
      await SharedPrefHelper.setSecuredString(
        PrefKeys.storeAddressId,
        data.storeAddress!.sId!,
      );
      AppInitialRoute.storeAddressId = data.storeAddress!.sId!;
    }

 
    if (data.storeAddress?.region?.en != null) {
      await SharedPrefHelper.setSecuredString(
        PrefKeys.storeRegion,
        data.storeAddress!.region!.en!,
      );
      AppInitialRoute.storeRegion = data.storeAddress!.region!.en!;
    }

    if (!isChangeUserPassword) {
      SharedPrefHelper.setData(PrefKeys.prefsSetLoginMap, true);
    }
  }
}
