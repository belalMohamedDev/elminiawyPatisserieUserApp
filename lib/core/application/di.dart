import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/login/bloc/login_bloc.dart';
import '../../feature/login/data/repository/login_repo.dart';
import '../network/api/app_api.dart';
import '../network/dio_factory/dio_factory.dart';
import '../network/network_connectivity/connectivity_controller.dart';
import '../services/app_storage.dart';
import 'bloc_observer.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  await _initAppModule();
  await _initLogin();
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

  instance
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()),
    )

    //dio factory
    // ..registerLazySingleton<DioFactory>(DioFactory.new,);
    ..registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  //app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
}

Future<void> _initLogin() async {
  instance
    ..registerLazySingleton<LoginRepository>(
        () => LoginRepository(instance(), instance()))
    ..registerFactory<LoginBloc>(() => LoginBloc(instance(), instance()));
}
