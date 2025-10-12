import 'package:elminiawy/feature/client/productBasedOnCategory/data/localDataSource/product_category_local_data_source.dart';

import '../../../../../../core/common/shared/shared_imports.dart'; //

class GetProductBasedOnCategoryRepository {
  GetProductBasedOnCategoryRepository(this._apiService);
  final AppServiceClient _apiService;

  Future<ApiResult<GetProductsBasedOnCategory>> getProductBasedOnCategory(
      String id) async {
    try {
      final cachedData = await ProductCategoryCache.getCachedProducts(id);

      if (cachedData != null) {
        final model = GetProductsBasedOnCategory.fromJson(cachedData);

        _refreshFromServer(id);
        return ApiResult.success(model);
      }

      final response = await _apiService.getProductsBasedOnCategory(id);


      await ProductCategoryCache.saveProducts(id, response.toJson());

 

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<void> _refreshFromServer(String id) async {
    try {
      final response = await _apiService.getProductsBasedOnCategory(id);
      await ProductCategoryCache.saveProducts(id, response.toJson());
    } catch (_) {}
  }
}
