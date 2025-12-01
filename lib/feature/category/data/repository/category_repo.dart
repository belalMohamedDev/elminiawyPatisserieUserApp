import 'dart:io';

import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/category/data/localDataSource/category_local_data_source.dart';

abstract class CategoryRepository {
  Future<ApiResult<CategoryResponse>> getCategoriesRepo({
    String? sort,
    String? active,
  });
  Future<ApiResult<CategoryResponse>> updateCategoriesTitleRepo(
    String id,
    String? titleAr,
    String? titleEn,
  );

  Future<ApiResult<CategoryResponse>> updateCategoriesActiveOrNotActiveRepo(
    String id,
    bool? isActive,
  );
  Future<ApiResult<CategoryResponse>> updateCategoriesImageRepo(
    String id,
    File image,
  );
  Future<ApiResult<ApiSuccessGeneralModel>> deleteCategoriesrepo(String id);

  Future<ApiResult<CategoryResponse>> createCategoriesrepo(
    String titleAr,
    String titleEn,
    File image,
  );
}

class CategoryRepositoryImplement implements CategoryRepository {
  CategoryRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  void Function(CategoryResponse)? onCategoryDataUpdated;

  @override
  Future<ApiResult<CategoryResponse>> getCategoriesRepo({
    String? sort,
    String? active,
  }) async {
    final Map<String, dynamic> queryRequest = {
      if (sort != null) 'sort': sort,
      if (active != null) 'active': active,
    };

    try {
      final cachedData = await CategoryLocalDataSource.getCachedCategoryData();

      if (cachedData != null) {
        final model = CategoryResponse.fromJson(cachedData);

        _refreshAndNotify(queryRequest);

        return ApiResult.success(model);
      }

      final response = await _apiService.getCategoriesService(queryRequest);
      await CategoryLocalDataSource.saveCategoryData(response.toJson());
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<void> _refreshAndNotify(Map<String, dynamic> queryRequest) async {
    try {
      final response = await _apiService.getCategoriesService(queryRequest);

      final isUpdated = await CategoryLocalDataSource.refreshAndCompare(
        response.toJson(),
      );

      if (isUpdated) {
        onCategoryDataUpdated?.call(response);
      }
    } catch (_) {}
  }

  @override
  Future<ApiResult<CategoryResponse>> updateCategoriesTitleRepo(
    String id,
    String? titleAr,
    String? titleEn,
  ) async {
    final Map<String, dynamic> requestBody = {
      'title': {"ar": titleAr, "en": titleEn},
    };
    try {
      final response = await _apiService.updateCategoriesService(
        id,
        requestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CategoryResponse>> updateCategoriesActiveOrNotActiveRepo(
    String id,
    bool? isActive,
  ) async {
    final Map<String, dynamic> requestBody = {'active': isActive};
    try {
      final response = await _apiService.updateCategoriesService(
        id,
        requestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ApiSuccessGeneralModel>> deleteCategoriesrepo(
    String id,
  ) async {
    try {
      final response = await _apiService.deleteCategoriesService(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CategoryResponse>> updateCategoriesImageRepo(
    String id,
    File image,
  ) async {
    try {
      final response = await _apiService.updateCategoriesImageService(
        id,
        image,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CategoryResponse>> createCategoriesrepo(
    String titleAr,
    String titleEn,
    File image,
  ) async {
    try {
      final response = await _apiService.createCategoriesService(
        titleAr,
        titleEn,
        image,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
