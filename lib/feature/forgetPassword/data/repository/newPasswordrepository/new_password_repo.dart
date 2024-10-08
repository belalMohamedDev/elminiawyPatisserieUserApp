import '../../../../../../core/common/shared/shared_imports.dart'; //

class NewPasswordRepository {
  NewPasswordRepository(this._apiService);
  final AppServiceClient _apiService;


  Future<ApiResult<AuthResponse>> newPassword(
    NewPasswordRequestBody newPasswordRequestBody,
  ) async {
 
      try {
        final response = await _apiService.newPassword(newPasswordRequestBody);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }
    
  }
}
