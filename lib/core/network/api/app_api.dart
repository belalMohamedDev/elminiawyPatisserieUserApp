import 'package:dio/dio.dart';
import 'package:elminiawy/feature/home/data/model/response/category_response.dart';
import 'package:elminiawy/feature/userAddress/data/model/response/create_address_response.dart';

import 'package:retrofit/retrofit.dart';

import '../../../feature/forgetPassword/data/model/bodyRequest/forget_password_body_request.dart';
import '../../../feature/forgetPassword/data/model/loginResponse/forget_password_response.dart';
import '../../../feature/home/data/model/response/banner_response.dart';
import '../../../feature/logOut/data/model/response/log_out_response.dart';
import '../../../feature/newProduct/model/response/product_response.dart';
import '../../../feature/login/data/model/bodyRequest/login_body_request.dart';
import '../../../feature/login/data/model/loginResponse/login_response.dart';
import '../../../feature/newPassword/data/model/bodyRequest/new_password_body_request.dart';
import '../../../feature/productBasedOnCategory/data/response/product_category.dart';
import '../../../feature/signUp/data/model/bodyRequest/sign_up_body_request.dart';
import '../../../feature/userAddress/data/model/request/create_address_request.dart';
import '../../../feature/userAddress/data/model/response/get_address_response.dart';
import '../../../feature/verifyCode/data/model/bodyRequest/verifiy_code_body_request.dart';
import '../../../feature/verifyCode/data/model/verifiyCodeResponse/verifiy_code_response.dart';
import '../../../feature/wishList/data/model/getWishListResponse/response.dart';
import '../api_constant/api_constant.dart';
import '../success/api_success_general.dart';

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
  Future<CategoryResponse> getCategories(
    @Query("sort") String sort,
  );

  @GET(ApiConstants.newProduct)
  Future<ProductResponse> getProduct();

  @GET(ApiConstants.wishList)
  Future<WishListProduct> getWishList();

  @POST(ApiConstants.wishList)
  Future<WishListProduct> addOrRemoveProductFromWishList(
      @Field("product") String product);

  @DELETE(ApiConstants.wishList)
  Future<WishListProduct> removeProductFromWishList(
      @Field("product") String product);

  @POST(ApiConstants.logOut)
  Future<LogOutResponse> logOut(
    @Field("refreshToken") String refreshToken,
  );

  @POST(ApiConstants.address)
  Future<CreateAddressResponse> createAddress(
    @Body() CreateAddressRequestBody createAddressRequestBody,
  );

  @GET(ApiConstants.address)
  Future<GetAddressResponse> getAllAddress();

  @PUT('${ApiConstants.address}/{id}')
  Future<CreateAddressResponse> updateAddress(
    @Path("id") String id,
    @Body() CreateAddressRequestBody createAddressRequestBody,
  );

  @DELETE('${ApiConstants.address}/{id}')
  Future<ApiSuccessGeneralModel> deleteAddress(
    @Path("id") String id,
  );

  @GET('${ApiConstants.product}/{id}/category')
  Future<GetProductsBasedOnCategory> getProductsBasedOnCategory(
    @Path("id") String id,
  );
}
