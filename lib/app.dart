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
          create: (context) => instance<AppLogicCubit>(),
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
            return FutureBuilder<String>(
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
                    // Initialize ScreenUtil to support different screen sizes and resolutions

                    designSize:
                        const Size(375, 812), // Base size for screen scaling
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
                        theme: getApplicationTheme(context),
                      );
                    },
                  );
                }
              },
            );
          }),
    );
  }
}

Future<String> checkIfLoggedInUser() async {

  var results = await Future.wait([
    SharedPrefHelper.getSecuredString(PrefKeys.refreshToken),
    SharedPrefHelper.getBool(PrefKeys.prefsKeyOnBoardingScreenView),
    SharedPrefHelper.getBool(PrefKeys.prefsKeyAnonymousUser),
    SharedPrefHelper.getSecuredString(PrefKeys.locationArea),
  ]);


  String? userToken = results[0] as String?;
  bool? isOnBoardingScreenView = results[1] as bool?;
  bool? isAnonymousUser = results[2] as bool?;
  String? locationArea = results[3] as String?;
  

  if (isOnBoardingScreenView == true) {
    if (isAnonymousUser == true) {
      if (locationArea == null || locationArea.isEmpty) {
        return Routes.map;
      } else {
        return Routes.bottomNavBarRoute;
      }
    } else if (userToken != null && userToken.isNotEmpty) {
      if (locationArea == null || locationArea.isEmpty) {
        return Routes.map;
      } else {
        return Routes.bottomNavBarRoute;
      }
    } else {
      return Routes.loginRoute;
    }
  } else {
    return Routes.onBoardingRoute;
  }
}


