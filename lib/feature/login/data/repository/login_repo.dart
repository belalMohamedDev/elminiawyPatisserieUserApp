import '../../../../../core/common/shared/shared_imports.dart'; //

class LoginRepository {
  LoginRepository(this._apiService);
  final AppServiceClient _apiService;


  Future<ApiResult<AuthResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
  
      try {
        final response = await _apiService.login(loginRequestBody);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }
   
  }
}
