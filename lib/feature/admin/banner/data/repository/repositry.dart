import '../../../../../core/common/shared/shared_imports.dart'; 


abstract class BannerRepository {
  Future<ApiResult<BannerResponse>> getBannerRepo();
}

class BannerRepositoryImplement implements BannerRepository {
  BannerRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  @override
  Future<ApiResult<BannerResponse>> getBannerRepo() async {
    try {
      final response = await _apiService.getBannersServic();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
