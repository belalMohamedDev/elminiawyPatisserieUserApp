
import 'package:elminiawy/feature/home/presentation/screen/home_screen.dart';
import 'package:elminiawy/feature/onBoarding/presentation/screen/on_boarding_view.dart';
import 'package:flutter/material.dart';


import '../style/fonts/strings_manger.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );
     
     
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
     
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.noRouteFound)),
        body: const SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(child: Text(AppStrings.noRouteFound)),
        ),
      ),
    );
  }
}
