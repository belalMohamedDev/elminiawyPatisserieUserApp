import '../../../../../core/common/shared/shared_imports.dart'; //

class LogOutRepository {
  LogOutRepository(this._apiService);
  final AppServiceClient _apiService;


  Future<ApiResult<ApiSuccessGeneralModel>> logOut(String refreshToken) async {

      try {
        final response = await _apiService.logOutService(refreshToken);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }

  }
}
