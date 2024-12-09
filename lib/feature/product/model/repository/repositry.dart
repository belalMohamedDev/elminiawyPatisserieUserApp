import 'dart:io';

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
    String? arDescription,
    String? enDescription,
    String? subCategory,
  });

  Future<ApiResult<ProductResponse>> updateProductImageRepo({
    required String id,
    required File image,
  });
  Future<ApiResult<ApiSuccessGeneralModel>> deleteProductRepo({
    required String id,
 
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
      String? arDescription,
      String? enDescription,
      String? subCategory}) async {
    final Map<String, dynamic> requestBody = {
      if (price!.isNotEmpty) 'price': price,
      if (arDescription!.isNotEmpty && enDescription!.isNotEmpty)
        'description': {"ar": arDescription, "en": enDescription},
      if (subCategory != null) 'subCategory': subCategory,
      if (arTitle!.isNotEmpty && enTitle!.isNotEmpty)
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

  @override
  Future<ApiResult<ProductResponse>> updateProductImageRepo(
      {required String id, required File image}) async {
    try {
      final response = await _apiService.updateProductImageService(id, image);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }


   @override
  Future<ApiResult<ApiSuccessGeneralModel>> deleteProductRepo(
      {required String id}) async {
    try {
      final response = await _apiService.deleteProductService(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
