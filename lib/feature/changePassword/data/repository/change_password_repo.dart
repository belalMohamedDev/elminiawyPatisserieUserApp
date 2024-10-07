import '../../../../../core/common/shared/shared_imports.dart'; //

class ChangeMyPasswordRepository {
  ChangeMyPasswordRepository(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  Future<ApiResult<UpdateMyPasswordResponse>> changeMypasswordRepo(
    ChangeMyPasswordRequestBody changeMyPasswordRequestBody,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService
            .updateMyPasswordService(changeMyPasswordRequestBody);
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
