import 'package:device_preview/device_preview.dart';
import 'package:elminiawy/core/application/cubit/app_logic_cubit.dart';
import 'package:elminiawy/core/application/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/route_manger.dart';
import 'core/routing/routes.dart';
import 'core/services/app_storage_key.dart';
import 'core/services/shared_pref_helper.dart';
import 'core/style/fonts/strings_manger.dart';
import 'core/style/theme/theme_manger.dart';
import 'core/utils/extensions.dart';
import 'feature/address/presentation/screen/map_screen.dart';
import 'feature/cart/cubit/cart_cubit.dart';
import 'feature/newProduct/Cubit/product_cubit.dart';
import 'feature/wishList/cubit/wish_list_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal(); // private named constructor

  static const MyApp _instance = MyApp._internal(); // singleton instance
  factory MyApp() => _instance; // factory

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => instance<AppLogicCubit>(),
        ),

        BlocProvider(
          create: (context) => instance<ProductCubit>(),
        ),
        BlocProvider(
          create: (context) => instance<WishListCubit>(),
        ),
        BlocProvider(
          create: (context) => instance<CartCubit>(),
        ),

      
      ],
      child: FutureBuilder<String>(
        future: checkIfLoggedInUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for the future
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle error
            return Center(child: Text('Error: //${snapshot.error}'));
          } else {
            // Build the MaterialApp with the initial route based on the future result
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              useInheritedMediaQuery: true,
              builder: (context, child) {
                return MaterialApp(
                  locale: DevicePreview.locale(context),
                  builder: DevicePreview.appBuilder,
                  title: AppStrings.appName,
                  debugShowCheckedModeBanner: false,
                  initialRoute: snapshot.data,
                  onGenerateRoute: RouteGenerator.getRoute,
                  home: const MapScreen(),
                  theme: getApplicationTheme(),
                );
              },
            );
          }
        },
      ),
    );
  }
}

Future<String> checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(PrefKeys.refreshToken);

  bool? isOnBoardingScreenView =
      await SharedPrefHelper.getBool(PrefKeys.prefsKeyOnBoardingScreenView);

  if (!userToken.isNullOrEmpty()) {
    return Routes.bottomNavBarRoute;
  } else if (isOnBoardingScreenView == true) {
    return Routes.loginRoute;
  } else {
    return Routes.onBoardingRoute;
  }
}
