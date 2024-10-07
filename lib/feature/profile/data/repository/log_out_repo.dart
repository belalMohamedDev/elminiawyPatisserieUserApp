import '../../../../../core/common/shared/shared_imports.dart'; //

class LogOutRepository {
  LogOutRepository(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  Future<ApiResult<LogOutResponse>> logOut(String refreshToken) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.logOut(refreshToken);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }
    } else {
      //return  internet connection error
      return ApiResult.failure(
          ApiErrorHandler.handle(AppStrings.pleaseCheckYourInternetConnection));    }
  }
}
