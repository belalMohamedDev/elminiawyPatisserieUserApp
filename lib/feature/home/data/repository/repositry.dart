import '../../../../../core/common/shared/shared_imports.dart'; //


abstract class HomeRepository {
  Future<ApiResult<BannerResponse>> getBanner();
  Future<ApiResult<CategoryResponse>> getCategories(String sort);

}

class HomeRepositoryImplement implements HomeRepository {
  HomeRepositoryImplement(this._networkInfo, this._apiService);

  final NetworkInfo _networkInfo;
  final AppServiceClient _apiService;

  @override
  Future<ApiResult<BannerResponse>> getBanner() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getBanners();
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }
    } else {
      //return  internet connection error
         return ApiResult.failure(
          ApiErrorHandler.handle(AppStrings.pleaseCheckYourInternetConnection));   
    }
  }

  @override
  Future<ApiResult<CategoryResponse>> getCategories(String sort) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getCategories(sort);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }
    } else {
      //return  internet connection error
           return ApiResult.failure(
          ApiErrorHandler.handle(AppStrings.pleaseCheckYourInternetConnection));   
    }
  }



}
