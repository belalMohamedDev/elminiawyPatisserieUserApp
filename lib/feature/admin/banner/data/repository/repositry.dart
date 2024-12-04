import 'dart:io';

import '../../../../../core/common/shared/shared_imports.dart';

abstract class BannerRepository {
  Future<ApiResult<BannerResponse>> getBannerRepo();
  Future<ApiResult<ApiSuccessGeneralModel>> deleteBannerRepo(String id);
  Future<ApiResult<BannerResponse>> createNewBannerRepo(
      String startDate, String endDate, File image);
}

class BannerRepositoryImplement implements BannerRepository {
  BannerRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  @override
  Future<ApiResult<BannerResponse>> getBannerRepo() async {
    try {
      final response = await _apiService.getBannersServic();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ApiSuccessGeneralModel>> deleteBannerRepo(String id) async {
    try {
      final response = await _apiService.deleteBannerService(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<BannerResponse>> createNewBannerRepo(
      String startDate, String endDate, File image) async {
    try {
      final response =
          await _apiService.createBannerService(startDate, endDate, image);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
