
import '../../../../../../core/common/shared/shared_imports.dart'; //

class ForgetPasswordRepository {
  ForgetPasswordRepository(this._apiService);
  final AppServiceClient _apiService;


  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequestBody forgetPasswordRequestBody,
  ) async {
  
      try {
        final response =
            await _apiService.forgetPassword(forgetPasswordRequestBody);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }
    } 
  }

