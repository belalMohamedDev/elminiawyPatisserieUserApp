
import 'package:flutter/material.dart';


import '../../feature/splash/presentation/screen/splash_view.dart';
import '../style/fonts/strings_manger.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      // case Routes.onBoardingRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnBoardingView(),
      //   );
      // case Routes.loginRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => instance<LoginBloc>(),
      //       child: const LoginView(),
      //     ),
      //   );

      // case Routes.registerRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => instance<SignUpBloc>(),
      //       child: const SignUpView(),
      //     ),
      //   );

     

      // case Routes.forgetPasswordRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider.value(
      //       value: instance<ForgetPasswordBloc>(),
      //       child: const ForgetPasswordScreen(),
      //     ),
      //   );

      //     case Routes.verificationCodeViewRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider.value(
      //       value: instance<ForgetPasswordBloc>(),
      //       child: const VerificationCodeView(),
      //     ),
      //   );

      // case Routes.newPassword:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider.value(
      //       value: instance<ForgetPasswordBloc>(),
      //       child: const NewPasswordView(),
      //     ),
      //   );
      //      case Routes.home:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeScreen(),
      //   );

      // case Routes.bottomNavBarRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const BottomNaveBarView(),
      //   );

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
