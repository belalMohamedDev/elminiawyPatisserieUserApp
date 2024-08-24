import 'package:elminiawy/feature/newProduct/presentation/screen/new_product_screen.dart';
import 'package:elminiawy/feature/search/presentation/screen/search_screen.dart';
import 'package:elminiawy/feature/signUp/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/address/logic/mapCubit/map_cubit.dart';
import '../../feature/address/logic/storeAddressCubit/store_address_cuibt_cubit.dart';
import '../../feature/bottomNavBar/presentation/nav_bar_view.dart';
import '../../feature/forgetPassword/bloc/forget_password_bloc.dart';
import '../../feature/forgetPassword/presntation/screen/forget_password_screen.dart';
import '../../feature/login/bloc/login_bloc.dart';
import '../../feature/login/presentation/screen/login_view.dart';
import '../../feature/newPassword/presentation/screen/new_password_view.dart';
import '../../feature/onBoarding/presentation/screen/on_boarding_view.dart';
import '../../feature/signUp/presentation/screen/sign_up_view.dart';
import '../../feature/address/logic/userAddressCubit/user_address_cubit.dart';
import '../../feature/address/presentation/screen/user_address_screen.dart';
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

      case Routes.address:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => instance<MapCubit>(),
              ),
              BlocProvider(
                create: (context) => instance<UserAddressCubit>(),
              ),
              BlocProvider(
                create: (context) => instance<StoreAddressCuibt>(),
              ),
            ],
            child: const UserAddressView(),
          ),
        );

      // case Routes.productBasedOnCategory:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => instance<ProductBasedOnCategoryCubit>(),
      //       child: const ProductBaseOnCategory(),

      //     ),
      //   );

      case Routes.bottomNavBarRoute:
        return MaterialPageRoute(
          builder: (_) => const BottomNavBar(),
        );

      case Routes.newProduct:
        return MaterialPageRoute(builder: (_) => const NewProductView());

      case Routes.search:
        return MaterialPageRoute(builder: (_) => const SearchView());

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
