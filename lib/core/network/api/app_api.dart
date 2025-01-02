import 'dart:io';

import 'package:retrofit/retrofit.dart';

import '../../../../../core/common/shared/shared_imports.dart'; //

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(ApiConstants.login)
  Future<AuthResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.google)
  Future<AuthResponse> googleService(
    @Body() Map<String, dynamic> registerRequestBody,
  );

  @POST(ApiConstants.signup)
  Future<AuthResponse> register(
    @Body() RegisterRequestBody registerRequestBody,
  );

  @POST(ApiConstants.forgetPassword)
  Future<ApiSuccessGeneralModel> forgetPassword(
    @Body() ForgetPasswordRequestBody forgetPasswordRequestBody,
  );

  @POST(ApiConstants.verifyCode)
  Future<ApiSuccessGeneralModel> verifyCode(
    @Body() VerifyCodeRequestBody verifyCodeRequestBody,
  );

  @PUT(ApiConstants.resetPassword)
  Future<AuthResponse> newPassword(
    @Body() NewPasswordRequestBody newPasswordRequestBody,
  );

  @GET(ApiConstants.banner)
  Future<BannerResponse> getBannersService(
    @Queries() Map<String, dynamic> requestQuary,
  );

  @POST(ApiConstants.banner)
  @MultiPart()
  Future<BannerResponse> createBannerService(
    @Part() String? startDate,
    @Part() String? endDate,
    @Part() File image,
  );

  @PUT("${ApiConstants.banner}/{id}")
  @MultiPart()
  Future<BannerResponse> updateImageBannerService(
    @Path("id") String id,
    @Part() File image,
  );

  @PUT("${ApiConstants.banner}/{id}")
  Future<BannerResponse> updateBannerDateService(
    @Path("id") String id,
    @Part() String? startDate,
    @Part() String? endDate,
  );

  @DELETE("${ApiConstants.banner}/{id}")
  Future<ApiSuccessGeneralModel> deleteBannerService(
    @Path("id") String id,
  );

  @GET(ApiConstants.category)
  Future<CategoryResponse> getCategoriesService(
    @Queries() Map<String, dynamic> requestQuary,
  );

  @PUT("${ApiConstants.category}/{id}")
  Future<CategoryResponse> updateCategoriesService(
    @Path("id") String id,
    @Body() Map<String, dynamic> requestBody,
  );

  @PUT("${ApiConstants.category}/{id}")
  @MultiPart()
  Future<CategoryResponse> updateCategoriesImageService(
    @Path("id") String id,
    @Part() File image,
  );

  @POST(ApiConstants.category)
  @MultiPart()
  Future<CategoryResponse> createCategoriesService(
    @Part(name: "title.ar") String arTitle,
    @Part(name: "title.en") String enTitle,
    @Part() File image,
  );

  @DELETE("${ApiConstants.category}/{id}")
  Future<ApiSuccessGeneralModel> deleteCategoriesService(
    @Path("id") String id,
  );

  @GET(ApiConstants.subCategories)
  Future<SubCategoryResponse> getSubCategoriesService();

  @DELETE("${ApiConstants.subCategories}/{id}")
  Future<ApiSuccessGeneralModel> deleteSubCategoriesService(
    @Path("id") String id,
  );

  @PUT("${ApiConstants.subCategories}/{id}")
  Future<SubCategoryResponse> updateSubCategoriesService(
    @Path("id") String id,
    @Body() Map<String, dynamic> requestBody,
  );

  @POST(ApiConstants.subCategories)
  Future<SubCategoryResponse> createNewSubCategoriesService(
    @Body() Map<String, dynamic> requestBody,
  );

  @GET(ApiConstants.newProduct)
  Future<ProductResponse> getNewProductToUserServices(
    @Query("limit") String? limit,
  );

  @GET(ApiConstants.newProduct)
  Future<ProductResponse> getUserProductService(
    @Queries() Map<String, dynamic> requestQuary,
  );

  @GET(ApiConstants.product)
  Future<ProductResponse> getAllProductService();

  @PUT("${ApiConstants.product}/{id}")
  Future<ProductResponse> updateProductService(
    @Path("id") String id,
    @Body() Map<String, dynamic> requestBody,
  );

  @PUT("${ApiConstants.product}/{id}")
  @MultiPart()
  Future<ProductResponse> updateProductImageService(
    @Path("id") String id,
    @Part() File image,
  );

  @POST(ApiConstants.product)
  @MultiPart()
  Future<ProductResponse> createProductService(
    @Part(name: "title.ar") String arTitle,
    @Part(name: "title.en") String enTitle,
    @Part(name: "subCategory") String subCategory,
    @Part(name: "description.en") String enDescription,
    @Part(name: "description.ar") String arDescription,
    @Part(name: "price") String price,
    @Part() File image,
  );

  @DELETE("${ApiConstants.product}/{id}")
  Future<ApiSuccessGeneralModel> deleteProductService(
    @Path("id") String id,
  );

  @GET(ApiConstants.newProduct)
  Future<ProductResponse> searchInProductService(
    @Query("sort") String? sort,
    @Query("keyword") String? keyword,
    @Query("price") String? price,
  );

  @GET("${ApiConstants.driver}/allDriverNotActive")
  Future<AuthResponse> getAllDriverNotActiveService();

  @PUT("${ApiConstants.driver}/{id}/active")
  Future<AuthResponse> activeDriverService(
    @Path("id") String id,
  );

  @GET("${ApiConstants.driver}/allDriverActive")
  Future<AuthResponse> getAllDriverActiveService();

  @DELETE("${ApiConstants.user}/{id}")
  Future<ApiSuccessGeneralModel> deleteUserService(
    @Path("id") String id,
  );

  @GET(ApiConstants.wishList)
  Future<ProductResponse> getWishListService();

  @POST(ApiConstants.wishList)
  Future<ProductResponse> addOrRemoveProductFromWishListService(
      @Field("product") String product);

  @POST(ApiConstants.logOut)
  Future<ApiSuccessGeneralModel> logOutService(
    @Field("refreshToken") String refreshToken,
  );

  @POST(ApiConstants.address)
  Future<CreateAddressResponse> createAddressService(
    @Body() Map<String, dynamic> createAddressRequestBody,
  );

  @POST("${ApiConstants.address}/isAvailable")
  Future<CheckLocationAvailableResponse> checkAddressAvaliableService(
    @Body() CheckAddressAvailableRequestBody checkAddressAvailableRequestBody,
  );

  @GET(ApiConstants.address)
  Future<GetAddressResponse> getAllAddressService();

  @PUT('${ApiConstants.address}/{id}')
  Future<CreateAddressResponse> updateAddressService(
    @Path("id") String id,
    @Body() Map<String, dynamic> createAddressRequestBody,
  );

  @DELETE('${ApiConstants.address}/{id}')
  Future<ApiSuccessGeneralModel> deleteAddressService(
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
  Future<AuthResponse> updateMyPasswordService(
    @Body() ChangeMyPasswordRequestBody changeMyPasswordRequestBody,
  );

  @DELETE(ApiConstants.deleteMyAccount)
  Future<ApiSuccessGeneralModel> deleteMyAccountService();

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

  @PUT('${ApiConstants.notification}/user/seen')
  Future<UserNotificationResponse> updateAllNotificationToSeenService();

  @DELETE('${ApiConstants.notification}/user/{id}')
  Future<UserNotificationResponse> deleteUserNotificationService(
    @Path("id") String id,
  );
}
