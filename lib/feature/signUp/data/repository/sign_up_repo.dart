


import '../../../../../core/common/shared/shared_imports.dart'; //

class RegisterRepository {
  RegisterRepository(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  Future<ApiResult<AuthResponse>> register(
    RegisterRequestBody registerRequestBody,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.register(registerRequestBody);
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
