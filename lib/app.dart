import 'package:device_preview/device_preview.dart';

import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class MyApp extends StatefulWidget {
  const MyApp._internal(); // private named constructor

  static const MyApp _instance = MyApp._internal(); // singleton instance
  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDependenciesLoaded = false;
  @override
  void initState() {
    super.initState();

    // Initialize connectivity controller to monitor internet status
    ConnectivityController.instance.init();
  }

  // factory
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => instance<AppLogicCubit>()..getSavedLanguage(),
        ),
      ],
      child: StreamBuilder<bool>(
          stream: ConnectivityController.instance.connectivityStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                      CircularProgressIndicator()); // Show loading while waiting for connection
            }

            if (snapshot.hasData && snapshot.data == false) {
              // Display "No Internet" screen when disconnected
              return const NoconnectionScreen();
            }

            if (!_isDependenciesLoaded) {
              // Load dependencies
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                await Firebase.initializeApp(
                  options: DefaultFirebaseOptions.currentPlatform,
                ).then(
                  (value) async {
                    await FirebaseCloudMessaging().init();

                    await LocalNotificationService.init();

                    setState(() {
                      _isDependenciesLoaded =
                          true; // Mark dependencies as loaded
                    });
                  },
                );
              });
            }
            // Build the MaterialApp with the initial route based on the future result
            return ScreenUtilInit(
              // Initialize ScreenUtil to support different screen sizes and resolutions

              designSize: const Size(375, 812), // Base size for screen scaling
              minTextAdapt: true,
              useInheritedMediaQuery: true,
              builder: (context, child) {
                return BlocBuilder<AppLogicCubit, AppLogicState>(
                  builder: (context, state) {
                    return MaterialApp(
                      locale:
                          Locale(context.read<AppLogicCubit>().currentLangCode),
                      supportedLocales: AppLocalizationsSetup.supportedLocales,
                      localizationsDelegates:
                          AppLocalizationsSetup.localizationsDelegates,
                      localeResolutionCallback:
                          AppLocalizationsSetup.localeResolutionCallback,

                      navigatorKey: instance<GlobalKey<NavigatorState>>(),

                      //  locale: DevicePreview.locale(context),
                      builder: DevicePreview.appBuilder,
                      title: 'Elminiawy Patisserie',
                      debugShowCheckedModeBanner: false,
                      initialRoute: AppInitialRoute.isOnBoardingScreen
                          ? AppInitialRoute.isAnonymousUser
                              ? AppInitialRoute.isLocatedMap
                                  ? Routes.bottomNavBarRoute
                                  : Routes.map
                              : AppInitialRoute.isLoggedInUser
                                  ? AppInitialRoute.isLocatedMap
                                      ? Routes.bottomNavBarRoute
                                      : Routes.map
                                  : Routes.loginRoute
                          : Routes.onBoardingRoute,
                      onGenerateRoute: RouteGenerator.getRoute,
                      theme: getApplicationTheme(context),
                    );
                  },
                );
              },
            );
          }),
    );
  }
}
