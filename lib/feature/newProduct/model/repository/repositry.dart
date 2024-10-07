
import '../../../../../core/common/shared/shared_imports.dart'; //

class ProductRepository {
  ProductRepository(this._networkInfo, this._apiService);

  final NetworkInfo _networkInfo;
  final AppServiceClient _apiService;

  Future<ApiResult<ProductResponse>> getNewProduct(
    ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getProduct();
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
