


import '../../../../../core/common/shared/shared_imports.dart'; //

class RegisterRepository {
  RegisterRepository(this._apiService);
  final AppServiceClient _apiService;


  Future<ApiResult<AuthResponse>> register(
    RegisterRequestBody registerRequestBody,
  ) async {

      try {
        final response = await _apiService.register(registerRequestBody);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }

    
  }
}
