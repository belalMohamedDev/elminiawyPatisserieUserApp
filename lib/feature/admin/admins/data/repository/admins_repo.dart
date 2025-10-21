import '../../../../../core/common/shared/shared_imports.dart';

abstract class AdminsRepository {
  Future<ApiResult<AuthResponse>> getAllAdminsRepo();

 
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

 

  
}
