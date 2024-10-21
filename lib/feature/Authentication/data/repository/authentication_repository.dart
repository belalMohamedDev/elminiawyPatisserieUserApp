
import '../../../../../core/common/shared/shared_imports.dart';

abstract class AuthenticationRepository {
  Future<ApiResult<AuthResponse>> authenticationWithGoogleRepo(
      RegisterRequestBody registerRequestBody);

  Future<ApiResult<AuthResponse>> registerToNewAccountRepo(
    RegisterRequestBody registerRequestBody,
  );

  Future<ApiResult<AuthResponse>> loginRepo(
    LoginRequestBody loginRequestBody,
  );
}

class AuthenticationRepositoryImplement implements AuthenticationRepository {
  AuthenticationRepositoryImplement(this._apiService);
  final AppServiceClient _apiService;

  @override
  Future<ApiResult<AuthResponse>> authenticationWithGoogleRepo(
      RegisterRequestBody registerRequestBody) async {
    try {
      final response =
          await _apiService.googleService(registerRequestBody.toFilteredJson());
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AuthResponse>> registerToNewAccountRepo(
    RegisterRequestBody registerRequestBody,
  ) async {
    try {
      final response = await _apiService.register(registerRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }


  @override
  Future<ApiResult<AuthResponse>> loginRepo(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
