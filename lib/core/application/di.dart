import 'package:elminiawy/core/application/bloc_observer.dart';
import 'package:elminiawy/core/network/api/app_api.dart';
import 'package:elminiawy/core/network/dio_factory/dio_factory.dart';
import 'package:elminiawy/core/network/network_connectivity/connectivity_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/app_storage.dart';

final instance = GetIt.instance;

Future<void> setupInjector() async {
  await _initAppModule();
}

Future<void> _initAppModule() async {
  // app module ,its a module where we put all generic dependencies
  Bloc.observer = AppBlocObserver();

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

//app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));


   //check internet connection
  instance
    .registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()),
    );

  //app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

//   // login
//   instance
//     ..registerLazySingleton<LoginRepository>(
//         () => LoginRepository(instance(), instance()))
//     ..registerFactory<LoginBloc>(() => LoginBloc(instance(), instance()));

// //register
//   instance
//     ..registerLazySingleton<RegisterRepository>(
//         () => RegisterRepository(instance(), instance()))
//     ..registerFactory<SignUpBloc>(() => SignUpBloc(instance(), instance()));

//   // forget password
//   // verify code repositry
//   // New Password Repository
//   instance
//     ..registerLazySingleton<ForgetPasswordRepository>(
//         () => ForgetPasswordRepository(instance(), instance()))
//     ..registerLazySingleton<VerifyCodeRepository>(
//         () => VerifyCodeRepository(instance(), instance()))
//     ..registerLazySingleton<NewPasswordRepository>(
//         () => NewPasswordRepository(instance(), instance()))
//     ..registerLazySingleton<ForgetPasswordBloc>(() =>
//         ForgetPasswordBloc(instance(), instance(), instance(), instance()));
}





// Future<void> _initAuth() async {
//   sl
//     ..registerFactory(() => AuthBloc(sl()))
//     ..registerLazySingleton(() => AuthRepos(sl()))
//     ..registerLazySingleton(() => AuthDataSource(sl()));
// }