import 'package:elminiawy/core/common/shared/shared_imports.dart';

abstract class SubCategoryRepository {
  Future<ApiResult<SubCategoryResponse>> getSubCategoriesRepo();
  Future<ApiResult<SubCategoryResponse>> updateSubCategoriesTitleRepo(String id,
      String? titleAr, String? titleEn, bool? active, String categoryId);

  // Future<ApiResult<CategoryResponse>> updateCategoriesActiveOrNotActiveRepo(
  //   String id,
  //   bool? isActive,
  // );
  // Future<ApiResult<CategoryResponse>> updateCategoriesImageRepo(
  //   String id,
  //   File image,
  // );
  Future<ApiResult<ApiSuccessGeneralModel>> deleteSubCategoriesrepo(
    String id,
  );

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

  @override
  Future<ApiResult<SubCategoryResponse>> updateSubCategoriesTitleRepo(
      String id,
      String? titleAr,
      String? titleEn,
      bool? active,
      String? categoryId) async {
    final Map<String, dynamic> requestBody = {
      'title': {"ar": titleAr, "en": titleEn},
      'category': categoryId,
      'active': active
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
