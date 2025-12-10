import 'dart:io';

import 'package:elminiawy/core/common/shared/shared_imports.dart';

abstract class DriverRepository {
  Future<ApiResult<AuthResponse>> getAllDriverRepo();
  Future<ApiResult<AuthResponse>> getAllActiveDriverRepo();
  Future<ApiResult<AuthResponse>> createNewDriverRepo({
    required String email,
    required String storeAddress,
    required File image,
  });

  Future<ApiResult<AuthResponse>> deleteDriverRepo({required String id});
}

class DriverRepositoryImplement implements DriverRepository {
  DriverRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  @override
  Future<ApiResult<AuthResponse>> getAllDriverRepo() async {
    try {
      final response = await _apiService.getAllDriverService();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AuthResponse>> getAllActiveDriverRepo() async {
    try {
      final response = await _apiService.getAllDriverActiveService();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AuthResponse>> createNewDriverRepo({
    required String email,
    required String storeAddress,
    required File image,
  }) async {
    try {
      final response = await _apiService.createNewAdminService(
        email,
        storeAddress,
        "delivery",
        image,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AuthResponse>> deleteDriverRepo({required String id}) async {
    try {
      final response = await _apiService.deleteAdminService(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
