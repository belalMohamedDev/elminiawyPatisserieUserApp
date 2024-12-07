import '../../../../core/common/shared/shared_imports.dart'; //

abstract class ProductRepository {
  Future<ApiResult<ProductResponse>> getNewProduct({
    String? limit,
    String? sort,
    String? keyword,
    String? price,
    String? active,
  });

  Future<ApiResult<ProductResponse>> getAllProduct();
}

class ProductRepositoryImplement implements ProductRepository {
  ProductRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  @override
  Future<ApiResult<ProductResponse>> getNewProduct({
    String? limit,
    String? sort,
    String? keyword,
    String? price,
    String? active,
  }) async {
    final Map<String, dynamic> queryRequest = {
      if (limit != null) 'limit': limit,
      if (sort != null) 'sort': sort,
      if (keyword != null) 'keyword': keyword,
      if (price != null) 'price': price,
      if (active != null) 'active': active,
    };

    try {
      final response = await _apiService.getUserProduct(queryRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductResponse>> getAllProduct() async {
    try {
      final response = await _apiService.getAllProduct();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
