

import 'package:elminiawy/core/common/shared/shared_imports.dart';

abstract class SubCategoryRepository {
  Future<ApiResult<SubCategoryResponse>> getSubCategoriesRepo();
  // Future<ApiResult<CategoryResponse>> updateCategoriesTitleRepo(
  //   String id,
  //   String? titleAr,
  //   String? titleEn,
  // );

  // Future<ApiResult<CategoryResponse>> updateCategoriesActiveOrNotActiveRepo(
  //   String id,
  //   bool? isActive,
  // );
  // Future<ApiResult<CategoryResponse>> updateCategoriesImageRepo(
  //   String id,
  //   File image,
  // );
  // Future<ApiResult<ApiSuccessGeneralModel>> deleteCategoriesrepo(
  //   String id,
  // );

  // Future<ApiResult<CategoryResponse>> createCategoriesrepo(
  //   String titleAr,
  //   String titleEn,
  //   File image,
  // );
}

class SubCategoryRepositoryImplement implements SubCategoryRepository {
  SubCategoryRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  @override
  Future<ApiResult<SubCategoryResponse>> getSubCategoriesRepo() async {
    try {
      final response = await _apiService.getSubCategoriesService();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  // @override
  // Future<ApiResult<CategoryResponse>> updateCategoriesTitleRepo(
  //     String id, String? titleAr, String? titleEn) async {
  //   final Map<String, dynamic> requestBody = {
  //     'title': {"ar": titleAr, "en": titleEn},
  //   };
  //   try {
  //     final response =
  //         await _apiService.updateCategoriesService(id, requestBody);
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ApiErrorHandler.handle(error));
  //   }
  // }

  // @override
  // Future<ApiResult<CategoryResponse>> updateCategoriesActiveOrNotActiveRepo(
  //     String id, bool? isActive) async {
  //   final Map<String, dynamic> requestBody = {
  //     'active': isActive,
  //   };
  //   try {
  //     final response =
  //         await _apiService.updateCategoriesService(id, requestBody);
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ApiErrorHandler.handle(error));
  //   }
  // }

  // @override
  // Future<ApiResult<ApiSuccessGeneralModel>> deleteCategoriesrepo(
  //     String id) async {
  //   try {
  //     final response = await _apiService.deleteCategoriesService(id);
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ApiErrorHandler.handle(error));
  //   }
  // }

  // @override
  // Future<ApiResult<CategoryResponse>> updateCategoriesImageRepo(
  //     String id, File image) async {
  //   try {
  //     final response =
  //         await _apiService.updateCategoriesImageService(id, image);
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ApiErrorHandler.handle(error));
  //   }
  // }

  // @override
  // Future<ApiResult<CategoryResponse>> createCategoriesrepo(
  //     String titleAr, String titleEn, File image) async {
  //   try {
  //     final response =
  //         await _apiService.createCategoriesService(titleAr, titleEn, image);
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ApiErrorHandler.handle(error));
  //   }
  // }
}
