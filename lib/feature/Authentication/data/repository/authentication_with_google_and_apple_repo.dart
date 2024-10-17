import '../../../../../core/common/shared/shared_imports.dart'; //

class AuthenticationRepository {
  AuthenticationRepository(this._apiService);
  final AppServiceClient _apiService;

  Future<ApiResult<AuthResponse>> authenticationWithGoogleRepo(
      String googleToken) async {
    try {
      final response = await _apiService.googleService(googleToken);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
