import 'package:dio/dio.dart';
import 'package:elminiawy/feature/changePassword/data/model/request/change_my_password_request.dart';
import 'package:elminiawy/feature/changePassword/data/model/response/change_my_password_response.dart';
import 'package:elminiawy/feature/home/data/model/response/category_response.dart';
import 'package:elminiawy/feature/address/data/model/response/create_address_response.dart';
import 'package:elminiawy/feature/order/data/model/requestBody/create_order_request.dart';
import 'package:elminiawy/feature/order/data/model/response/create_order.dart';

import 'package:retrofit/retrofit.dart';

import '../../../feature/accountInfo/data/model/request/update_account_information.dart';
import '../../../feature/accountInfo/data/model/response/delete_account.dart';
import '../../../feature/accountInfo/data/model/response/update_account_information.dart';
import '../../../feature/address/data/model/response/get_store_address_response.dart';
import '../../../feature/cart/data/model/bodyRequest/add_item.dart';
import '../../../feature/cart/data/model/response/get_cart.dart';
import '../../../feature/changeEmailAddress/data/model/request/change_email_request.dart';
import '../../../feature/changeEmailAddress/data/model/response/change_email_response.dart';
import '../../../feature/forgetPassword/data/model/bodyRequest/forget_password_body_request.dart';
import '../../../feature/forgetPassword/data/model/loginResponse/forget_password_response.dart';
import '../../../feature/home/data/model/response/banner_response.dart';
import '../../../feature/logOut/data/model/response/log_out_response.dart';
import '../../../feature/newProduct/model/response/product_response.dart';
import '../../../feature/login/data/model/bodyRequest/login_body_request.dart';
import '../../../feature/login/data/model/loginResponse/login_response.dart';
import '../../../feature/newPassword/data/model/bodyRequest/new_password_body_request.dart';
import '../../../feature/notification/data/model/user_notification_resp.dart';
import '../../../feature/order/data/model/response/get_order.dart';
import '../../../feature/productBasedOnCategory/data/response/product_category.dart';
import '../../../feature/signUp/data/model/bodyRequest/sign_up_body_request.dart';
import '../../../feature/address/data/model/response/get_address_response.dart';
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

  @POST(ApiConstants.logOut)
  Future<LogOutResponse> logOut(
    @Field("refreshToken") String refreshToken,
  );

  @POST(ApiConstants.address)
  Future<CreateAddressResponse> createAddress(
    @Body() Map<String, dynamic> createAddressRequestBody,
  );

  @GET(ApiConstants.address)
  Future<GetAddressResponse> getAllAddress();

  @PUT('${ApiConstants.address}/{id}')
  Future<CreateAddressResponse> updateAddress(
    @Path("id") String id,
    @Body() Map<String, dynamic> createAddressRequestBody,
  );

  @DELETE('${ApiConstants.address}/{id}')
  Future<ApiSuccessGeneralModel> deleteAddress(
    @Path("id") String id,
  );

  @GET('${ApiConstants.product}/{id}/category')
  Future<GetProductsBasedOnCategory> getProductsBasedOnCategory(
    @Path("id") String id,
  );

  @POST(ApiConstants.cart)
  Future<CartResponse> addItemToCart(
    @Body() AddItemToCartRequestBody addItemToCartRequestBody,
  );

  @GET(ApiConstants.cart)
  Future<CartResponse> getCartItem();

  @DELETE('${ApiConstants.cart}/{id}')
  Future<CartResponse> removeItemFromCart(
    @Path("id") String id,
  );

  @DELETE('${ApiConstants.cart}/clearAllItems')
  Future<CartResponse> deleteCartService();

  @PUT('${ApiConstants.cart}/{id}')
  Future<CartResponse> updateItemQuantityFromCart(
    @Path("id") String id,
    @Field("quantity") int quantity,
  );

  @PUT('${ApiConstants.cart}/applyCoupon')
  Future<CartResponse> applyCouponToCart(
    @Field("coupon") String coupon,
  );

  @GET(ApiConstants.storeAddress)
  Future<GetStoreAddressResponse> getAllStoreBranch();

  @PUT(ApiConstants.updateMyData)
  Future<UpdateAccountInformationResponse> updateMyData(
    @Body()
    UpdateAccountInformationRequestBody updateAccountInformationRequestBody,
  );

  @PUT(ApiConstants.updateMyEmailAddress)
  Future<UpdateEmailAddressResponse> updateMyEmailAddress(
    @Body() ChangeEmailRequestBody changeEmailRequestBody,
  );

  @PUT(ApiConstants.updateMyPassword)
  Future<UpdateMyPasswordResponse> updateMyPasswordService(
    @Body() ChangeMyPasswordRequestBody changeMyPasswordRequestBody,
  );

  @DELETE(ApiConstants.deleteMyAccount)
  Future<DeleteAccountResponse> deleteMyAccountService();

  @POST(ApiConstants.order)
  Future<CreateOrderResponse> createCashOrderService(
    @Body() CreateOrderRequestBody createOrderRequestBody,
  );

  @PUT('${ApiConstants.order}/{id}/cancelled')
  Future<CreateOrderResponse> orderCancellService(
    @Path("id") String id,
  );

  @GET('${ApiConstants.order}/user')
  Future<GetOrdersResponse> getAllOrderCompleteService();

   @GET('${ApiConstants.order}/user/pending')
  Future<GetOrdersResponse> getAllOrderPendingService();

  
  @GET('${ApiConstants.notification}/user')
  Future<UserNotificationResponse> getAllNotificationToUserService();
}
