import '../../../../core/common/shared/shared_imports.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => instance<LoginBloc>(),
              ),
              BlocProvider(
                  create: (context) =>
                      instance<AuthenticationWithGoogleAndAppleCubit>()),
            ],
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
          builder: (_) => BlocProvider.value(
            value: instance<UserAddressCubit>(),
            child: const UserAddressView(),
          ),
        );

      case Routes.addNewAddress:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: instance<UserAddressCubit>(),
              ),
              BlocProvider.value(
                value: instance<PaymentCubit>(),
              ),
              BlocProvider.value(
                value: instance<MapCubit>(),
              ),
            ],
            child: const AddNewAddressScreen(),
          ),
        );

      case Routes.map:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: instance<MapCubit>(),
            child: const MapScreen(),
          ),
        );

      case Routes.accountInfomation:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => instance<AccountInformationCubit>(),
              ),
              BlocProvider(
                create: (context) =>
                    instance<AuthenticationWithGoogleAndAppleCubit>(),
              ),
            ],
            child: const AccountInfomation(),
          ),
        );

      case Routes.changeMyEmail:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<ChangeEmailAddressCubit>(),
            child: const ChangeEmailScreen(),
          ),
        );
      case Routes.changeMyPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<ChangeMyPasswordCubit>(),
            child: const ChangePasswordScreen(),
          ),
        );

      case Routes.bottomNavBarRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: instance<UserAddressCubit>(),
              ),
              BlocProvider(
                create: (context) => instance<BannerCubit>(),
              ),
              BlocProvider(
                create: (context) => instance<CategoryCubit>(),
              ),
              BlocProvider.value(
                value: instance<MapCubit>(),
              ),
              BlocProvider.value(
                value: instance<CartCubit>(),
              ),
              BlocProvider.value(
                value: instance<ProductCubit>(),
              ),
              BlocProvider.value(
                value: instance<WishListCubit>(),
              ),
            ],
            child: const BottomNavBar(),
          ),
        );

      case Routes.newProduct:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: instance<CartCubit>(),
              ),
              BlocProvider.value(
                value: instance<ProductCubit>(),
              ),
              BlocProvider.value(
                value: instance<WishListCubit>(),
              ),
            ],
            child: const NewProductView(),
          ),
        );

      case Routes.notification:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => instance<UserNotificationCubit>(),
            child: const UserNotificationScreen(),
          ),
        );

      case Routes.orderPlaced:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: instance<PaymentCubit>(),
            child: const OrderPlaced(),
          ),
        );
      case Routes.orderDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: instance<PaymentCubit>(),
            child: const OrderDetails(),
          ),
        );

      case Routes.myOrder:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: instance<PaymentCubit>(),
                  child: const MyOrdersScreen(),
                ));

      case Routes.wishList:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: instance<CartCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<ProductCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<WishListCubit>(),
                    ),
                  ],
                  child: const WishListView(),
                ));

      case Routes.cart:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: instance<UserAddressCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<CartCubit>(),
                    ),
                  ],
                  child: const CartView(),
                ));

      case Routes.search:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: instance<SearchBloc>(),
                  child: const SearchView(),
                ));

      case Routes.noRoute:
        return MaterialPageRoute(builder: (_) => const RouteStatesScreen());

      case Routes.shippingAddress:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: instance<MapCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<PaymentCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<UserAddressCubit>(),
                    ),
                  ],
                  child: const ShippingAddress(),
                ));

      case Routes.shippingPayment:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: instance<PaymentCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<CartCubit>(),
                    ),
                  ],
                  child: const PaymentScreen(),
                ));

      case Routes.shippingReviewScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: instance<PaymentCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<CartCubit>(),
                    ),
                    BlocProvider.value(
                      value: instance<UserAddressCubit>(),
                    ),
                  ],
                  child: const ReviewPaymentScreen(),
                ));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(context.translate(AppStrings.noRouteFound)),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Text(context.translate(AppStrings.noRouteFound)),
          ),
        ),
      ),
    );
  }
}
