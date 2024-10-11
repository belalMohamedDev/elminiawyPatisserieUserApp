import 'package:device_preview/device_preview.dart';

import '../../../../../core/common/shared/shared_imports.dart'; //

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize environment variables
  await EnvVariable.instance.init();

  await initAppModule();

  await checkIfLoggedInUser();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: ColorManger.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

checkIfLoggedInUser() async {
  var results = await Future.wait([
    SharedPrefHelper.getSecuredString(PrefKeys.refreshToken),
    SharedPrefHelper.getBool(PrefKeys.prefsKeyOnBoardingScreenView),
    SharedPrefHelper.getBool(PrefKeys.prefsKeyAnonymousUser),
    SharedPrefHelper.getSecuredString(PrefKeys.locationArea),
  ]);

  String? userToken = results[0] as String?;
  bool? isOnBoardingScreenView = results[1] as bool?;
  bool? isAnonymousUserlogic = results[2] as bool?;
  String? locationArea = results[3] as String?;

  

  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }

  if (isOnBoardingScreenView == true) {
    isOnBoardingScreen = true;
  }

  if (isAnonymousUserlogic == true) {
    isAnonymousUser = true;
  }

  if (!locationArea.isNullOrEmpty()) {
    isLocatedMap = true;
  } else {
    isLocatedMap = false;
  }


}
