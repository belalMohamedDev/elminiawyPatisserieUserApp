
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/route_manger.dart';
import 'core/routing/routes.dart';
import 'core/style/theme/theme_manger.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal(); //privet named constructor

  static const MyApp _instance =
      MyApp._internal(); //singleton or single _instance
  factory MyApp() => _instance; //factory

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return  ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onBoardingRoute,
          onGenerateRoute: RouteGenerator.getRoute,
           theme: getApplicationTheme(),
        ));
  }
}
