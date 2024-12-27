import 'package:elminiawy/core/common/shared/shared_imports.dart';

abstract class DriverRepository {
  Future<ApiResult<AuthResponse>> getAllNotActiveDriverRepo();
  Future<ApiResult<AuthResponse>> getAllActiveDriverRepo();
}

class DriverRepositoryImplement implements DriverRepository {
  DriverRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  @override
  Future<ApiResult<AuthResponse>> getAllNotActiveDriverRepo() async {
    try {
      final response = await _apiService.getAllDriverNotActiveService();
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
}
