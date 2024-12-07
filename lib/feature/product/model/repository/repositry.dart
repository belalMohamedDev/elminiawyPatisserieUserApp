import '../../../../core/common/shared/shared_imports.dart'; //

abstract class ProductRepository {
  Future<ApiResult<ProductResponse>> getNewProductRepo({
    String? limit,
    String? sort,
    String? keyword,
    String? price,
    String? active,
  });

  Future<ApiResult<ProductResponse>> updateProductRepo({
    bool? active,
    String? arTitle,
    required String id,
    String? enTitle,
    String? price,
    String? description,
    String? subCategory,
  });

  Future<ApiResult<ProductResponse>> getAllProductRepo();
}

class ProductRepositoryImplement implements ProductRepository {
  ProductRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  @override
  Future<ApiResult<ProductResponse>> getNewProductRepo({
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
      final response = await _apiService.getUserProductService(queryRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductResponse>> getAllProductRepo() async {
    try {
      final response = await _apiService.getAllProductService();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductResponse>> updateProductRepo(
      {bool? active,
      required String id,
      String? arTitle,
      String? enTitle,
      String? price,
      String? description,
      String? subCategory}) async {
    final Map<String, dynamic> requestBody = {
      if (price != null) 'price': price,
      if (description != null) 'description': description,
      if (subCategory != null) 'subCategory': subCategory,
      if (arTitle != null && enTitle != null)
        'title': {"ar": arTitle, "en": enTitle},
      if (active != null) 'active': active,
    };

    try {
      final response = await _apiService.updateProductService(id, requestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
