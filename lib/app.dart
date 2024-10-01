import 'package:device_preview/device_preview.dart';

import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

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
                  home: const RouteStatesScreen(),
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
  // String? userToken =
  //     await SharedPrefHelper.getSecuredString(PrefKeys.refreshToken);

  // String? locationArea =
  //     await SharedPrefHelper.getSecuredString(PrefKeys.locationArea);

  // bool? isOnBoardingScreenView =
  //     await SharedPrefHelper.getBool(PrefKeys.prefsKeyOnBoardingScreenView);

  // if (!userToken.isNullOrEmpty()) {
  //   return Routes.bottomNavBarRoute;
  // } else if (isOnBoardingScreenView == true) {
  //   return Routes.loginRoute;
  // } else {
  //   return Routes.onBoardingRoute;
  // }

  String? userToken =
      await SharedPrefHelper.getSecuredString(PrefKeys.refreshToken);

  bool? isOnBoardingScreenView =
      await SharedPrefHelper.getBool(PrefKeys.prefsKeyOnBoardingScreenView);

  bool? isAnonymousUser =
      await SharedPrefHelper.getBool(PrefKeys.prefsKeyAnonymousUser);

  String? locationArea =
      await SharedPrefHelper.getSecuredString(PrefKeys.locationArea);

  if (isOnBoardingScreenView == true) {
    if (locationArea == '' || locationArea.isEmpty) {
      return Routes.map;
    } else {
     
      if (isAnonymousUser == true) {
        
        return Routes.bottomNavBarRoute; 
      } else if (!userToken.isNullOrEmpty()) {
       
        return Routes
            .bottomNavBarRoute; 
      } else {
        return Routes.loginRoute; 
      }
    }
  } else if (!userToken.isNullOrEmpty()) {
    if (locationArea == '' || locationArea.isEmpty) {
      return Routes.map;
    } else {
      return Routes.bottomNavBarRoute;
    }
  } else {
    return Routes.onBoardingRoute; 
  }
}
