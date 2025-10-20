import 'package:elminiawy/core/common/shared/shared_imports.dart';

abstract class DriverRepository {
  Future<ApiResult<AuthResponse>> getAllDriverRepo();
  Future<ApiResult<AuthResponse>> getAllActiveDriverRepo();
  Future<ApiResult<AuthResponse>> driverActivedRepo(
    String id,
  );
  Future<ApiResult<ApiSuccessGeneralModel>> deleteDriverRepo(
    String id,
  );
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
  Future<ApiResult<AuthResponse>> driverActivedRepo(String id) async {
    try {
      final response = await _apiService.activeDriverService(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ApiSuccessGeneralModel>> deleteDriverRepo(String id) async {
    try {
      final response = await _apiService.deleteUserService(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
