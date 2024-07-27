import 'package:elminiawy/feature/signUp/bloc/sign_up_bloc.dart';
import 'package:elminiawy/feature/wishList/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/bottomNavBar/presentation/nav_bar_view.dart';
import '../../feature/forgetPassword/bloc/forget_password_bloc.dart';
import '../../feature/forgetPassword/presntation/screen/forget_password_screen.dart';
import '../../feature/home/logic/bannerCubit/banner_cubit.dart';
import '../../feature/home/logic/categoryCubit/category_cubit.dart';
import '../../feature/home/logic/productCubit/product_cubit.dart';
import '../../feature/login/bloc/login_bloc.dart';
import '../../feature/login/presentation/screen/login_view.dart';
import '../../feature/newPassword/presentation/screen/new_password_view.dart';
import '../../feature/onBoarding/presentation/screen/on_boarding_view.dart';
import '../../feature/signUp/presentation/screen/sign_up_view.dart';
import '../../feature/verifyCode/presentation/screen/verification_code.dart';
import '../application/di.dart';
import '../style/fonts/strings_manger.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<LoginBloc>(),
            child: const LoginView(),
          ),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );

      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<SignUpBloc>(),
            child: const SignUpView(),
          ),
        );

      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: instance<ForgetPasswordBloc>(),
            child: const ForgetPasswordScreen(),
          ),
        );

      case Routes.verificationCodeViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: instance<ForgetPasswordBloc>(),
            child: const VerificationCodeView(),
          ),
        );

      case Routes.newPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: instance<ForgetPasswordBloc>(),
            child: const NewPasswordView(),
          ),
        );

      case Routes.bottomNavBarRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => instance<BannerCubit>(),
              ),
              BlocProvider(
                create: (context) => instance<CategoryCubit>(),
              ),
              BlocProvider(
                create: (context) => instance<ProductCubit>(),
              ),
              BlocProvider(
                create: (context) => instance<WishListCubit>(),
              ),
            ],
            child: const BottomNavBar(),
          ),
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
