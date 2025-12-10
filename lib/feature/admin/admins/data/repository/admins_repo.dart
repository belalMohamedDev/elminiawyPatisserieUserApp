import 'dart:io';

import '../../../../../core/common/shared/shared_imports.dart';

abstract class AdminsRepository {
  Future<ApiResult<AuthResponse>> getAllAdminsRepo();
  Future<ApiResult<AuthResponse>> createNewAdminRepo({
    required String email,
    required String storeAddress,
    required File image,
  });

  Future<ApiResult<AuthResponse>> deleteAdminRepo({required String id});
}

class AdminsRepositoryImplement implements AdminsRepository {
  AdminsRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  @override
  Future<ApiResult<AuthResponse>> getAllAdminsRepo() async {
    try {
      final response = await _apiService.getAllAdminsService();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AuthResponse>> createNewAdminRepo({
    required String email,
    required String storeAddress,
    required File image,
  }) async {
    try {
      final response = await _apiService.createNewAdminService(
        email,
        storeAddress,
        image,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AuthResponse>> deleteAdminRepo({required String id}) async {
    try {
      final response = await _apiService.deleteAdminService(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
