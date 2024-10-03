
import '../../../../../../core/common/shared/shared_imports.dart'; //

class VerifyCodeRepository {
  VerifyCodeRepository(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  Future<ApiResult<VerifyCodeResponse>> verifyCode(
    VerifyCodeRequestBody verifyCodeRequestBody,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.verifyCode(verifyCodeRequestBody);
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
