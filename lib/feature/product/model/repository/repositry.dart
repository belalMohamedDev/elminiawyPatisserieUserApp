import 'dart:io';

import 'package:elminiawy/feature/product/model/localDataSource/new_product_local_data_source.dart';

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

  Future<ApiResult<ProductResponse>> createProductRepo({
    required String arTitle,
    required String enTitle,
    required String price,
    required String arDescription,
    required String enDescription,
    required String subCategory,
    required File image,
  });

  Future<ApiResult<ProductResponse>> updateProductImageRepo({
    required String id,
    required File image,
  });
  Future<ApiResult<ApiSuccessGeneralModel>> deleteProductRepo({
    required String id,
  });

  Future<ApiResult<ProductResponse>> getAllProductRepo(int? limit, int? page);
}

class ProductRepositoryImplement implements ProductRepository {
  ProductRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  void Function(ProductResponse)? onNewProductDataUpdated;

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
      final cachedData =
          await NewProductLocalDataSource.getCachedNewProductData();

      if (cachedData != null) {
        final model = ProductResponse.fromJson(cachedData);

        _refreshAndNotify(queryRequest);

        return ApiResult.success(model);
      }

      final response = await _apiService.getUserProductService(queryRequest);

      await NewProductLocalDataSource.saveNewProductData(response.toJson());

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<void> _refreshAndNotify(Map<String, dynamic> queryRequest) async {
    try {
      final response = await _apiService.getUserProductService(queryRequest);

      final isUpdated = await NewProductLocalDataSource.refreshAndCompare(
        response.toJson(),
      );

      if (isUpdated) {
        onNewProductDataUpdated?.call(response);
      }
    } catch (_) {}
  }

  @override
  Future<ApiResult<ProductResponse>> getAllProductRepo(
    int? limit,
    int? page,
  ) async {
    try {
      final response = await _apiService.getAllProductService(limit, page);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductResponse>> createProductRepo({
    required String arTitle,
    required String enTitle,
    required String price,
    required String arDescription,
    required String enDescription,
    required String subCategory,
    required File image,
  }) async {
    try {
      final response = await _apiService.createProductService(
        arTitle,
        enTitle,
        subCategory,
        enDescription,
        arDescription,
        price,
        image,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductResponse>> updateProductRepo({
    bool? active,
    required String id,
    String? arTitle,
    String? enTitle,
    String? price,
    String? arDescription,
    String? enDescription,
    String? subCategory,
  }) async {
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
  Future<ApiResult<ProductResponse>> updateProductImageRepo({
    required String id,
    required File image,
  }) async {
    try {
      final response = await _apiService.updateProductImageService(id, image);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ApiSuccessGeneralModel>> deleteProductRepo({
    required String id,
  }) async {
    try {
      final response = await _apiService.deleteProductService(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
