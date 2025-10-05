import 'package:elminiawy/core/common/shared/shared_imports.dart';

abstract class SubCategoryRepository {
  Future<ApiResult<SubCategoryResponse>> getSubCategoriesRepo(
      int? limit, int? page);
  Future<ApiResult<SubCategoryResponse>> updateSubCategoriesRepo(String id,
      String? titleAr, String? titleEn, bool? active, String? categoryId);

  Future<ApiResult<ApiSuccessGeneralModel>> deleteSubCategoriesrepo(
    String id,
  );

  Future<ApiResult<SubCategoryResponse>> createNewSubCategoriesrepo(
    String titleAr,
    String titleEn,
    String categoryId,
  );
}

class SubCategoryRepositoryImplement implements SubCategoryRepository {
  SubCategoryRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  @override
  Future<ApiResult<SubCategoryResponse>> getSubCategoriesRepo(
      int? limit, int? page) async {
    try {
      final response = await _apiService.getSubCategoriesService(limit, page);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<SubCategoryResponse>> updateSubCategoriesRepo(
      String id,
      String? titleAr,
      String? titleEn,
      bool? active,
      String? categoryId) async {
    final Map<String, dynamic> requestBody = {
      if (titleAr != null &&
          titleEn != null &&
          titleAr.isNotEmpty &&
          titleEn.isNotEmpty)
        'title': {
          'ar': titleAr,
          'en': titleEn,
        },
      if (categoryId != null) 'category': categoryId,
      if (active != null) 'active': active,
    };

    try {
      final response =
          await _apiService.updateSubCategoriesService(id, requestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ApiSuccessGeneralModel>> deleteSubCategoriesrepo(
      String id) async {
    try {
      final response = await _apiService.deleteSubCategoriesService(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<SubCategoryResponse>> createNewSubCategoriesrepo(
      String titleAr, String titleEn, String categoryId) async {
    final Map<String, dynamic> requestBody = {
      'title': {
        'ar': titleAr,
        'en': titleEn,
      },
      'category': categoryId,
    };
    try {
      final response =
          await _apiService.createNewSubCategoriesService(requestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
