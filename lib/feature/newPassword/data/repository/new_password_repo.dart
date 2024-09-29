
import '../../../../../core/common/shared/shared_imports.dart'; //

class NewPasswordRepository {
  NewPasswordRepository(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  Future<ApiResult<AuthResponse>> newPassword(
    NewPasswordRequestBody newPasswordRequestBody,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.newPassword(newPasswordRequestBody);
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
