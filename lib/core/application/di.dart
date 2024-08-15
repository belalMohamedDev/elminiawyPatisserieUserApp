import 'package:dio/dio.dart';
import 'package:elminiawy/feature/address/logic/mapCubit/map_cubit.dart';
import 'package:elminiawy/feature/cart/cubit/cart_cubit.dart';
import 'package:elminiawy/feature/cart/data/repository/cart_repo.dart';
import 'package:elminiawy/feature/home/logic/bannerCubit/banner_cubit.dart';
import 'package:elminiawy/feature/home/logic/categoryCubit/category_cubit.dart';
import 'package:elminiawy/feature/logOut/cubit/log_out_cubit.dart';
import 'package:elminiawy/feature/logOut/data/repository/log_out_repo.dart';
import 'package:elminiawy/feature/productBasedOnCategory/data/repository/product_category_repo.dart';
import 'package:elminiawy/feature/wishList/cubit/wish_list_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../feature/address/data/repository/store_address_repo.dart';
import '../../feature/address/logic/storeAddressCubit/store_address_cuibt_cubit.dart';
import '../../feature/forgetPassword/bloc/forget_password_bloc.dart';
import '../../feature/forgetPassword/data/repository/forget_password_repo.dart';
import '../../feature/home/data/repository/repositry.dart';
import '../../feature/newProduct/Cubit/product_cubit.dart';
import '../../feature/login/bloc/login_bloc.dart';
import '../../feature/login/data/repository/login_repo.dart';
import '../../feature/newPassword/data/repository/new_password_repo.dart';
import '../../feature/newProduct/model/repository/repositry.dart';
import '../../feature/productBasedOnCategory/cubit/product_based_on_category_cubit.dart';
import '../../feature/signUp/bloc/sign_up_bloc.dart';
import '../../feature/signUp/data/repository/sign_up_repo.dart';
import '../../feature/address/logic/userAddressCubit/user_address_cubit.dart';
import '../../feature/address/data/repository/address_repo.dart';
import '../../feature/verifyCode/data/repository/verify_code_repo.dart';
import '../../feature/wishList/data/repository/repository.dart';
import '../network/api/app_api.dart';
import '../network/dio_factory/dio_factory.dart';
import '../network/network_connectivity/connectivity_controller.dart';
import 'bloc_observer.dart';
import 'cubit/app_logic_cubit.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  await Future.wait([
    _initAppModule(),
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
    _initCart()
  ]);
}

Future<void> _initAppModule() async {
  // app module ,its a module where we put all generic dependencies
  Bloc.observer = AppBlocObserver();

  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnectionChecker()),
  );

  // Dio & ApiService

  Dio dio = DioFactory.getDio();

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //home repository
  instance.registerLazySingleton<HomeRepositoryImplement>(
      () => HomeRepositoryImplement(
            instance(),
            instance(),
          ));

  // app logic cuibt
  instance.registerFactory<AppLogicCubit>(() => AppLogicCubit());
}

Future<void> _initLogin() async {
  instance
    ..registerLazySingleton<LoginRepository>(
        () => LoginRepository(instance(), instance()))
    ..registerFactory<LoginBloc>(() => LoginBloc(
          instance(),
        ));
}

Future<void> _initSignUp() async {
  instance
    ..registerLazySingleton<RegisterRepository>(
        () => RegisterRepository(instance(), instance()))
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
        () => ForgetPasswordRepository(instance(), instance()))
    ..registerLazySingleton<VerifyCodeRepository>(
        () => VerifyCodeRepository(instance(), instance()))
    ..registerLazySingleton<NewPasswordRepository>(
        () => NewPasswordRepository(instance(), instance()))
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
      () => ProductRepository(instance(), instance()));
  instance.registerFactory<ProductCubit>(() => ProductCubit(
        instance(),
      ));
}

Future<void> _initWishList() async {
  instance
    ..registerLazySingleton<WishListRepositoryImplement>(
        () => WishListRepositoryImplement(instance(), instance()))
    ..registerFactory<WishListCubit>(() => WishListCubit(
          instance(),
        ));
}

Future<void> _initLogOut() async {
  instance
    ..registerLazySingleton<LogOutRepository>(
        () => LogOutRepository(instance(), instance()))
    ..registerFactory<LogOutCubit>(() => LogOutCubit(
          instance(),
        ));
}

Future<void> _initAddress() async {
  instance
    ..registerLazySingleton<UserAddressRepositoryImplement>(
        () => UserAddressRepositoryImplement(instance(), instance()))
    ..registerFactory<UserAddressCubit>(() => UserAddressCubit(
          instance(),
        ))
    ..registerFactory<MapCubit>(() => MapCubit());

  instance
    ..registerLazySingleton<StoreAddressRepositoryImplement>(
        () => StoreAddressRepositoryImplement(instance(), instance()))
    ..registerFactory<StoreAddressCuibtCubit>(() => StoreAddressCuibtCubit(
          instance(),
        ));
}

Future<void> _initProductBasedOnCategory() async {
  instance
    ..registerLazySingleton<GetProductBasedOnCategoryRepository>(
        () => GetProductBasedOnCategoryRepository(instance(), instance()))
    ..registerFactory<ProductBasedOnCategoryCubit>(
        () => ProductBasedOnCategoryCubit(
              instance(),
            ));
}

Future<void> _initCart() async {
  instance
    ..registerLazySingleton<CartRepositoryImplement>(
        () => CartRepositoryImplement(instance(), instance()))
    ..registerFactory<CartCubit>(() => CartCubit(
          instance(),
        ));
}
