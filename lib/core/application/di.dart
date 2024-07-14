import 'package:dio/dio.dart';
import 'package:elminiawy/feature/signUp/bloc/sign_up_bloc.dart';
import 'package:elminiawy/feature/signUp/data/repository/sign_up_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../feature/forgetPassword/bloc/forget_password_bloc.dart';
import '../../feature/forgetPassword/data/repository/forget_password_repo.dart';
import '../../feature/login/bloc/login_bloc.dart';
import '../../feature/login/data/repository/login_repo.dart';
import '../../feature/newPassword/data/repository/new_password_repo.dart';
import '../../feature/verifyCode/data/repository/verify_code_repo.dart';
import '../network/api/app_api.dart';
import '../network/dio_factory/dio_factory.dart';
import '../network/network_connectivity/connectivity_controller.dart';
import 'bloc_observer.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  await _initAppModule();
  await _initLogin();
  await _initSignUp();
  await _initForgetPassword();
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
}







/////////////////////////////////
//////////////
///////////////////////
Future<void> _initLogin() async {
  instance
    ..registerLazySingleton<LoginRepository>(
        () => LoginRepository(instance(), instance()))
    ..registerFactory<LoginBloc>(() => LoginBloc(instance(), ));
}

Future<void> _initSignUp() async {
  instance
    ..registerLazySingleton<RegisterRepository>(
        () => RegisterRepository(instance(), instance()))
    ..registerFactory<SignUpBloc>(() => SignUpBloc(instance(), ));
}

// // forget password
// // verify code repositry
// // New Password Repository
Future<void> _initForgetPassword() async {
  instance
    ..registerLazySingleton<ForgetPasswordRepository>(
        () => ForgetPasswordRepository(instance(), instance()))
    ..registerLazySingleton<VerifyCodeRepository>(
        () => VerifyCodeRepository(instance(), instance()))
    ..registerLazySingleton<NewPasswordRepository>(
        () => NewPasswordRepository(instance(), instance()))
    ..registerLazySingleton<ForgetPasswordBloc>(() =>
        ForgetPasswordBloc(instance(), instance(), instance(), ));
}
