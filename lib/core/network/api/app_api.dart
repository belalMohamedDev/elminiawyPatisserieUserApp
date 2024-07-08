
import 'package:dio/dio.dart';
import 'package:elminiawy/core/network/api_constant/api_constant.dart';

import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  // @POST(ApiConstants.login)
  // Future<LoginResponse> login(
  //   @Body() LoginRequestBody loginRequestBody,
  // );

  // @POST(ApiConstants.signup)
  // Future<RegisterResponse> register(
  //   @Body() RegisterRequestBody registerRequestBody,
  // );

  // @POST(ApiConstants.forgetPassword)
  // Future<ForgetPasswordResponse> forgetPassword(
  //   @Body() ForgetPasswordRequestBody forgetPasswordRequestBody,
  // );

  // @POST(ApiConstants.verifyCode)
  // Future<VerifyCodeResponse> verifyCode(
  //   @Body() VerifyCodeRequestBody verifyCodeRequestBody,
  // );

  // @PUT(ApiConstants.resetPassword)
  // Future<NewPasswordResponse> newPassword(
  //   @Body() NewPasswordRequestBody newPasswordRequestBody,
  // );
  // @POST(ApiConstants.getFound)
  // @MultiPart()
  // Future<MakeUnReportResponse> makeUnReport(
  //   @Part() String address,
  //   @Part() String description,
  //   @Part() File image,
  // );

  // @POST(ApiConstants.getMissing)
  // @MultiPart()
  // Future<MakeAReportResopnse> makeAReport(
  //   @Part() String name,
  //   @Part() String age,
  //   @Part() String address,
  //   @Part() String clothesLastSeenWearing,
  //   @Part() String describtion,
  //   @Part() File image,
  // );

  // @POST(ApiConstants.getMissing)
  // @MultiPart()
  // Future<MakeAReportObjectResopnse> makeAReportObjet(
  //   @Part() String address,
  //   @Part() String describtion,
  //   @Part() File image,
  // );

  // @PUT(ApiConstants.updateMyImage)
  // @MultiPart()
  // Future<UserDataModelResponse> updateMyImage(
  //   @Part() File image,
  // );

  // @PUT(ApiConstants.updateMyPassword)
  // Future<UserDataModelResponse> updateMyPassword(
  //   @Body() UpdatePasswordRequestBody updatePasswordRequestBody,
  // );

  // @PUT(ApiConstants.updateMyData)
  // Future<UserDataModelResponse> updateMyData(
  //   @Body() UpdateMyDataRequestBody updateMyDataRequestBody,
  // );

  // @GET(ApiConstants.getMissing)
  // Future<GetMissingResopnse> getMissing(
  //   @Queries() GetMissingReportQueries getMissingReportQueries,
  // );

  // @GET(ApiConstants.getFound)
  // Future<GetFoundResopnse> getFound(
  //   @Queries() GetFoundReportQueries getFoundReportParam,
  // );

  // @GET(ApiConstants.getNotification)
  // Future<NotificationResponse> getNotification(
  //   @Queries() GetNotificationQueries getNotificationQueries,
  // );
}
