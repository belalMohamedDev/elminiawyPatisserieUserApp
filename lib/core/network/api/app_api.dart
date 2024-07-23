import 'package:dio/dio.dart';
import 'package:elminiawy/feature/home/data/response/category_response.dart';

import 'package:retrofit/retrofit.dart';

import '../../../feature/forgetPassword/data/model/bodyRequest/forget_password_body_request.dart';
import '../../../feature/forgetPassword/data/model/loginResponse/forget_password_response.dart';
import '../../../feature/home/data/response/banner_response.dart';
import '../../../feature/home/data/response/product_response.dart';
import '../../../feature/login/data/model/bodyRequest/login_body_request.dart';
import '../../../feature/login/data/model/loginResponse/login_response.dart';
import '../../../feature/newPassword/data/model/bodyRequest/new_password_body_request.dart';
import '../../../feature/signUp/data/model/bodyRequest/sign_up_body_request.dart';
import '../../../feature/verifyCode/data/model/bodyRequest/verifiy_code_body_request.dart';
import '../../../feature/verifyCode/data/model/verifiyCodeResponse/verifiy_code_response.dart';
import '../api_constant/api_constant.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(ApiConstants.login)
  Future<AuthResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signup)
  Future<AuthResponse> register(
    @Body() RegisterRequestBody registerRequestBody,
  );

  @POST(ApiConstants.forgetPassword)
  Future<ForgetPasswordResponse> forgetPassword(
    @Body() ForgetPasswordRequestBody forgetPasswordRequestBody,
  );

  @POST(ApiConstants.verifyCode)
  Future<VerifyCodeResponse> verifyCode(
    @Body() VerifyCodeRequestBody verifyCodeRequestBody,
  );

  @PUT(ApiConstants.resetPassword)
  Future<AuthResponse> newPassword(
    @Body() NewPasswordRequestBody newPasswordRequestBody,
  );

  @GET(ApiConstants.banner)
  Future<BannerResponse> getBanners();

  @GET(ApiConstants.category)
  Future<CategoryResponse> getCategories();

  @GET(ApiConstants.product)
  Future<ProductResponse> getProduct(
     @Query("limit") int limit ,
  );



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
