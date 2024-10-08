import 'package:elminiawy/feature/search/bloc/search_bloc.dart';

import '../../../../core/common/shared/shared_imports.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  await Future.wait([
    _initAppModule(),
    _initPlaces(),
    _initLogin(),
    _initSignUp(),
    _initForgetPassword(),
    _initBanner(),
    _initCatogry(),
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
    _initSearch()
  ]);
}

Future<void> _initAppModule() async {
  // app module ,its a module where we put all generic dependencies

  await ScreenUtil.ensureScreenSize();

  Bloc.observer = AppBlocObserver();

  // Dio & ApiService

  Dio dio = DioFactory.getDio();

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //home repository
  instance.registerLazySingleton<HomeRepositoryImplement>(
      () => HomeRepositoryImplement(
            instance(),
          ));

  // app logic cuibt
  instance.registerFactory<AppLogicCubit>(() => AppLogicCubit());
}

Future<void> _initPlaces() async {
  final places = GoogleMapsPlaces(apiKey: EnvVariable.instance.mapKey);

  instance.registerLazySingleton<GoogleMapsPlaces>(() => places);
}

Future<void> _initLogin() async {
  instance
    ..registerLazySingleton<LoginRepository>(() => LoginRepository(instance()))
    ..registerFactory<LoginBloc>(() => LoginBloc(
          instance(),
        ));
}

Future<void> _initSignUp() async {
  instance
    ..registerLazySingleton<RegisterRepository>(
        () => RegisterRepository(instance()))
    ..registerFactory<SignUpBloc>(() => SignUpBloc(
          instance(),
        ));
}

// forget password
// verify code repositry
// New Password Repository
Future<void> _initForgetPassword() async {
  instance
    ..registerLazySingleton<ForgetPasswordRepository>(
        () => ForgetPasswordRepository(instance()))
    ..registerLazySingleton<VerifyCodeRepository>(
        () => VerifyCodeRepository(instance()))
    ..registerLazySingleton<NewPasswordRepository>(
        () => NewPasswordRepository(instance()))
    ..registerLazySingleton<ForgetPasswordBloc>(
        () => ForgetPasswordBloc(instance(), instance(), instance()));
}

// home cuibt
// banner repositry
Future<void> _initBanner() async {
  instance.registerFactory<BannerCubit>(() => BannerCubit(
        instance(),
      ));
}

Future<void> _initCatogry() async {
  instance.registerFactory<CategoryCubit>(() => CategoryCubit(
        instance(),
      ));
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
