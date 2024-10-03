
import '../../../../../../core/common/shared/shared_imports.dart'; //

class ForgetPasswordRepository {
  ForgetPasswordRepository(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequestBody forgetPasswordRequestBody,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _apiService.forgetPassword(forgetPasswordRequestBody);
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
