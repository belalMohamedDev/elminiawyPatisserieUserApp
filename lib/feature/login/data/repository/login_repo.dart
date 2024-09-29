

import '../../../../../core/common/shared/shared_imports.dart'; //

class LoginRepository {
  LoginRepository(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  Future<ApiResult<AuthResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.login(loginRequestBody);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error).apiErrorModel);
      }
    } else {
      //return  internet connection error
      return ApiResult.failure(DataSource.noInternetConnection.getFailure());
    }
  }
}
