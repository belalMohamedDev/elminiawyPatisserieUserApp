import 'dart:io';

import 'package:elminiawy/feature/admin/banner/data/localDataSource/banner_local_data_source.dart';

import '../../../../../core/common/shared/shared_imports.dart';

abstract class BannerRepository {
  Future<ApiResult<BannerResponse>> getBannerRepo({String? endDate});
  Future<ApiResult<ApiSuccessGeneralModel>> deleteBannerRepo(String id);
  Future<ApiResult<BannerResponse>> createNewBannerRepo(
    String startDate,
    String endDate,
    File image,
  );

  Future<ApiResult<BannerResponse>> updateBannerImageRepo(
    String id,
    File image,
  );

  Future<ApiResult<BannerResponse>> updateBannerDateRepo(
    String id,
    String? startDate,
    String? endDate,
  );
}

class BannerRepositoryImplement implements BannerRepository {
  BannerRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  void Function(BannerResponse)? onBannerDataUpdated;

  @override
  Future<ApiResult<BannerResponse>> getBannerRepo({String? endDate}) async {
    final Map<String, dynamic> queryRequest = {
      if (endDate != null) 'endDate': endDate,
    };
    try {
      final cachedData = await BannerLocalDataSource.getCachedBannerData();

      if (cachedData != null) {
        final model = BannerResponse.fromJson(cachedData);

        _refreshAndNotify(queryRequest);

        return ApiResult.success(model);
      }
      final response = await _apiService.getBannersService(queryRequest);

      await BannerLocalDataSource.saveBannerData(response.toJson());
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<void> _refreshAndNotify(Map<String, dynamic> queryRequest) async {
    try {
      final response = await _apiService.getBannersService(queryRequest);

      final isUpdated = await BannerLocalDataSource.refreshAndCompare(
        response.toJson(),
      );

      if (isUpdated) {
        onBannerDataUpdated?.call(response);
      }
    } catch (_) {}
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
    String startDate,
    String endDate,
    File image,
  ) async {
    try {
      final response = await _apiService.createBannerService(
        startDate,
        endDate,
        image,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<BannerResponse>> updateBannerImageRepo(
    String id,
    File image,
  ) async {
    try {
      final response = await _apiService.updateImageBannerService(id, image);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<BannerResponse>> updateBannerDateRepo(
    String id,
    String? startDate,
    String? endDate,
  ) async {
    try {
      final response = await _apiService.updateBannerDateService(
        id,
        startDate,
        endDate,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
