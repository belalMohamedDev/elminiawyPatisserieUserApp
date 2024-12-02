import 'package:flutter_google_maps_webservices/places.dart';

import '../../../../core/common/shared/shared_imports.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  await Future.wait([
    _initAppModule(),
    _initCategory(),
    _initBanner(),
    _initPlaces(),
    _initLogin(),
    _initSignUp(),
    _initForgetPassword(),
    _initProduct(),
    _initWishList(),
    _initLogOut(),
    _initAddress(),
    _initProductBasedOnCategory(),
    _initCart(),
    _initAccoutInformation(),
    _initChangeEmailAddress(),
    _initChangeMyPassword(),
    _initPayment(),
    _initNotification(),
    _initSearch(),
    _initSignInWithGoogleAndApple(),
    _initAdminHome(),
    _initSubCategory()
  ]);
}

Future<void> _initAppModule() async {
  // app module ,its a module where we put all generic dependencies

  await ScreenUtil.ensureScreenSize();

  Bloc.observer = AppBlocObserver();

  final navigatorKey = GlobalKey<NavigatorState>();
  instance.registerLazySingleton<ImagePicker>(ImagePicker.new);
  // Dio & ApiService

  Dio dio = DioFactory.getDio();

  instance
    ..registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerFactory<AppLogicCubit>(() => AppLogicCubit());
}

Future<void> _initBanner() async {
  // //home repository
  instance
    ..registerLazySingleton<BannerRepositoryImplement>(() => BannerRepositoryImplement(
          instance(),
        ))
    ..registerFactory<BannerCubit>(() => BannerCubit(
          instance(),
        ));
}

Future<void> _initAdminHome() async {
  // //home repository
  instance.registerFactory<AdminHomeCubit>(() => AdminHomeCubit());
}

Future<void> _initCategory() async {
  // //home repository
  instance
    ..registerLazySingleton<CategoryRepositoryImplement>(
        () => CategoryRepositoryImplement(
              instance(),
            ))
    ..registerFactory<CategoryCubit>(() => CategoryCubit(
          instance(),
          instance(),
        ));
}


Future<void> _initSubCategory() async {
  // //home repository
  instance
    ..registerLazySingleton<SubCategoryRepositoryImplement>(
        () => SubCategoryRepositoryImplement(
              instance(),
            ))
    ..registerFactory<SubCategoriesCubit>(() => SubCategoriesCubit(
          instance(),
     
        ));
}


Future<void> _initPlaces() async {
  final places = GoogleMapsPlaces(apiKey: EnvVariable.instance.mapKey);

  instance.registerLazySingleton<GoogleMapsPlaces>(() => places);
}

Future<void> _initLogin() async {
  instance.registerFactory<LoginBloc>(() => LoginBloc(
        instance(),
      ));
}

Future<void> _initSignInWithGoogleAndApple() async {
  instance
    ..registerLazySingleton<AuthenticationRepositoryImplement>(
        () => AuthenticationRepositoryImplement(instance()))
    ..registerFactory<AuthenticationWithGoogleAndAppleCubit>(
        () => AuthenticationWithGoogleAndAppleCubit(
              instance(),
            ));
}

Future<void> _initSignUp() async {
  instance.registerFactory<SignUpBloc>(() => SignUpBloc(
        instance(),
      ));
}

// forget password
// verify code repositry
// New Password Repository
Future<void> _initForgetPassword() async {
  instance.registerLazySingleton<ForgetPasswordBloc>(
      () => ForgetPasswordBloc(instance(), instance(), instance()));
}

Future<void> _initProduct() async {
  instance.registerLazySingleton<ProductRepository>(
      () => ProductRepository(instance()));
  instance.registerLazySingleton<ProductCubit>(() => ProductCubit(
        instance(),
      ));
}

Future<void> _initWishList() async {
  instance
    ..registerLazySingleton<WishListRepositoryImplement>(
        () => WishListRepositoryImplement(instance()))
    ..registerLazySingleton<WishListCubit>(() => WishListCubit(
          instance(),
        ));
}

Future<void> _initLogOut() async {
  instance
    ..registerLazySingleton<LogOutRepository>(() => LogOutRepository(
          instance(),
        ))
    ..registerFactory<LogOutCubit>(() => LogOutCubit(
          instance(),
        ));
}

Future<void> _initAddress() async {
  instance
    ..registerLazySingleton<UserAddressRepositoryImplement>(
        () => UserAddressRepositoryImplement(instance()))
    ..registerLazySingleton<MapCubit>(() => MapCubit(
          instance(),
          instance(),
        ))
    ..registerLazySingleton<UserAddressCubit>(() => UserAddressCubit(
          instance(),
        ));
}

Future<void> _initProductBasedOnCategory() async {
  instance
    ..registerLazySingleton<GetProductBasedOnCategoryRepository>(
        () => GetProductBasedOnCategoryRepository(instance()))
    ..registerFactory<ProductBasedOnCategoryCubit>(
        () => ProductBasedOnCategoryCubit(
              instance(),
            ));
}

Future<void> _initCart() async {
  instance
    ..registerLazySingleton<CartRepositoryImplement>(
        () => CartRepositoryImplement(instance()))
    ..registerLazySingleton<CartCubit>(() => CartCubit(
          instance(),
        ));
}

Future<void> _initAccoutInformation() async {
  instance
    ..registerLazySingleton<AccountInformationRepositoryImplement>(
        () => AccountInformationRepositoryImplement(instance()))
    ..registerFactory<AccountInformationCubit>(() => AccountInformationCubit(
          instance(),
        ));
}

Future<void> _initChangeEmailAddress() async {
  instance
    ..registerLazySingleton<ChangeEmailAddressRepository>(
        () => ChangeEmailAddressRepository(instance()))
    ..registerFactory<ChangeEmailAddressCubit>(() => ChangeEmailAddressCubit(
          instance(),
        ));
}

Future<void> _initChangeMyPassword() async {
  instance
    ..registerLazySingleton<ChangeMyPasswordRepository>(
        () => ChangeMyPasswordRepository(instance()))
    ..registerFactory<ChangeMyPasswordCubit>(() => ChangeMyPasswordCubit(
          instance(),
        ));
}

Future<void> _initPayment() async {
  instance
    ..registerLazySingleton<OrderRepositoryImplement>(
        () => OrderRepositoryImplement(instance()))
    ..registerLazySingleton<PaymentCubit>(() => PaymentCubit(instance()));
}

Future<void> _initNotification() async {
  instance
    ..registerLazySingleton<UserNotificationRepositoryImplement>(
        () => UserNotificationRepositoryImplement(instance()))
    ..registerFactory<UserNotificationCubit>(
        () => UserNotificationCubit(instance()));
}

Future<void> _initSearch() async {
  instance
    ..registerLazySingleton<SearchInProductRepository>(
        () => SearchInProductRepository(instance()))
    ..registerLazySingleton<SearchBloc>(() => SearchBloc(instance()));
}
