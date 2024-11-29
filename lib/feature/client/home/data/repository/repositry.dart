import '../../../../../core/common/shared/shared_imports.dart'; //

class BannerRepository {
  BannerRepository(this._apiService);

  final AppServiceClient _apiService;

  Future<ApiResult<BannerResponse>> getBannerRepo() async {
    try {
      final response = await _apiService.getBannersServic();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
