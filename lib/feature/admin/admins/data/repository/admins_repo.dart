import '../../../../../core/common/shared/shared_imports.dart';

abstract class AdminsRepository {
  Future<ApiResult<AuthResponse>> getAllActiveAdminsRepo();
  Future<ApiResult<AuthResponse>> getAllInActiveAdminsRepo();
  // Future<ApiResult<ApiSuccessGeneralModel>> deleteBannerRepo(String id);
  // Future<ApiResult<BannerResponse>> createNewBannerRepo(
  //     String startDate, String endDate, File image);

  // Future<ApiResult<BannerResponse>> updateBannerImageRepo(
  //     String id, File image);

  // Future<ApiResult<BannerResponse>> updateBannerDateRepo(
  //     String id, String? startDate, String? endDate);
}

class AdminsRepositoryImplement implements AdminsRepository {
  AdminsRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  @override
  Future<ApiResult<AuthResponse>> getAllActiveAdminsRepo() async {
    try {
      final response = await _apiService.getAllActiveAdminsService();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AuthResponse>> getAllInActiveAdminsRepo() async {
    try {
      final response = await _apiService.getAllInActiveAdminsService();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  // @override
  // Future<ApiResult<ApiSuccessGeneralModel>> deleteBannerRepo(String id) async {
  //   try {
  //     final response = await _apiService.deleteBannerService(id);
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ApiErrorHandler.handle(error));
  //   }
  // }

  // @override
  // Future<ApiResult<BannerResponse>> createNewBannerRepo(
  //     String startDate, String endDate, File image) async {
  //   try {
  //     final response =
  //         await _apiService.createBannerService(startDate, endDate, image);
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ApiErrorHandler.handle(error));
  //   }
  // }

  // @override
  // Future<ApiResult<BannerResponse>> updateBannerImageRepo(
  //     String id, File image) async {
  //   try {
  //     final response = await _apiService.updateImageBannerService(id, image);
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ApiErrorHandler.handle(error));
  //   }
  // }

  // @override
  // Future<ApiResult<BannerResponse>> updateBannerDateRepo(
  //     String id, String? startDate, String? endDate) async {
  //   try {
  //     final response =
  //         await _apiService.updateBannerDateService(id, startDate, endDate);
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ApiErrorHandler.handle(error));
  //   }
  // }
}
