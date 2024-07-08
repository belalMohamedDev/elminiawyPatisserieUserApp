// import 'dart:async';

// import 'package:flutter/material.dart';

// import '../../../core/services/app_storage.dart';
// import '../../../core/application/di.dart';

// abstract class _SplashControllerInput {
// //this class using to handling function
//   void animationInitilization(); //animation to Image
//   void startDelay(); // set timer to splash screen
//   void goNext(); // this func use to navigate onboarding ,login or home page
// }

// class SplashController extends GetxController
//     with GetSingleTickerProviderStateMixin
//     implements _SplashControllerInput {
//   final AppPreferences _appPreferences = instance<AppPreferences>();
//   late AnimationController animationController;
//   late Animation<double> animation;

//   @override
//   void onInit() {
//     super.onInit();
//     animationInitilization();
//     startDelay();
//   }

//   @override
//   animationInitilization() {
//     animationController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2));
//     animation =
//         CurvedAnimation(parent: animationController, curve: Curves.easeOut)
//             .obs
//             .value;

//     animation.addListener(() => update());
//     animationController.forward();
//   }

//   @override
//   startDelay() {
//     Timer(const Duration(seconds: AppConstant.splashDelay), goNext);
//   }

//   @override
//   goNext() async {
//     _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
//           if (isUserLoggedIn)
//             {
//               //navigate to main screen

//               Get.offAllNamed(Routes.bottomNavBarRoute)
//             }
//           else
//             {
//               _appPreferences
//                   .isOnBoardingScreenView()
//                   .then((isOnBoardingScreenView) => {
//                         if (isOnBoardingScreenView)
//                           {
//                             //navigate to login screen

//                             Get.offAllNamed(Routes.loginRoute)
//                           }
//                         else
//                           {
//                             //navigate to onBoarding screen
//                             Get.offAllNamed(Routes.onBoardingRoute)
//                           }
//                       })
//             }
//         });
//   }
// }
