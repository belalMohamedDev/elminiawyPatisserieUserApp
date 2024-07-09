import 'dart:async';

import 'package:elminiawy/core/application/constant_manger.dart';
import 'package:elminiawy/core/application/di.dart';
import 'package:elminiawy/core/services/app_storage.dart';
import 'package:elminiawy/feature/splash/presentation/refactor/splash_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void initState() {
    Timer(const Duration(seconds: AppConstant.splashDelay), _goNext);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashBody());
  }

  

/////logic to navigation
  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {
              //navigate to main screen

              // Get.offAllNamed(Routes.bottomNavBarRoute)
            }
          else
            {
              _appPreferences
                  .isOnBoardingScreenView()
                  .then((isOnBoardingScreenView) => {
                        if (isOnBoardingScreenView)
                          {
                            //navigate to login screen

                            // Get.offAllNamed(Routes.loginRoute)
                          }
                        else
                          {
                            //navigate to onBoarding screen
                            // Get.offAllNamed(Routes.onBoardingRoute)
                          }
                      })
            }
        });
  }
}
