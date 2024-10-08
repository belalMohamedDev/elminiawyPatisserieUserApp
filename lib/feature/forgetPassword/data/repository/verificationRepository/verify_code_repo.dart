
import '../../../../../../core/common/shared/shared_imports.dart'; //

class VerifyCodeRepository {
  VerifyCodeRepository(this._apiService);
  final AppServiceClient _apiService;


  Future<ApiResult<VerifyCodeResponse>> verifyCode(
    VerifyCodeRequestBody verifyCodeRequestBody,
  ) async {
  
      try {
        final response = await _apiService.verifyCode(verifyCodeRequestBody);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }
   
  }
}
