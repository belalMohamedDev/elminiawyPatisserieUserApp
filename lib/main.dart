import 'package:device_preview/device_preview.dart';

import '../../../../../core/common/shared/shared_imports.dart'; //

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1) Initialize SharedPref + Secure Storage
  await SharedPrefHelper.getInstancePreferences();

  // 2) Initialize env variables
  await EnvVariable.instance.init();

  // 3) Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 4) Load initial route data (depends on SharedPref)
  await AppInitialRoute().getStoreDataAndCheckInitialRoute();

  // 5) Initialize Dependency Injection
  await initAppModule();

  // 6) Init Local Notifications (no need to wait for FCM)
  await LocalNotificationService.init();

  // 7) Init Firebase Cloud Messaging (MUST BE AFTER SharedPrefHelper & Firebase)
  await FirebaseCloudMessaging().init();

  // 8) System UI
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: ColorManger.white,
    statusBarIconBrightness: Brightness.dark,
  ));

  // 9) Run app
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}