import 'package:elminiawy/core/common/statsScreen/route_state.dart';
import 'package:elminiawy/feature/admin/home/presentation/screen/delivered_orders.dart';
import 'package:elminiawy/feature/admin/home/presentation/screen/panding_driver.dart';
import 'package:elminiawy/feature/admin/storeAddress/logic/store_address_cubit.dart';
import 'package:elminiawy/feature/admin/storeAddress/presentation/screens/store_address_screen.dart';
import 'package:elminiawy/feature/admin/subCategory/presentation/screens/add_new_sub_category.dart';
import 'package:elminiawy/feature/category/presentation/screen/add_new_category.dart';
import 'package:elminiawy/feature/product/logic/adminProduct/admin_product_cubit.dart';
import 'package:elminiawy/feature/product/presenatation/screen/add_product.dart';

import '../../../../core/common/shared/shared_imports.dart';
import '../../feature/admin/home/presentation/screen/canelled_orders.dart';
import '../../feature/admin/home/presentation/screen/complete_orders.dart';
import '../../feature/admin/home/presentation/screen/new_orders.dart';
import '../../feature/admin/home/presentation/screen/pending_orders.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // ---------------------- AUTH -----------------------
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => instance<LoginBloc>()),
              BlocProvider(
                create: (context) =>
                    instance<AuthenticationWithGoogleAndAppleCubit>(),
              ),
            ],
            child: const LoginView(),
          ),
        );

      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      // ---------------------- ADMIN CATEGORY -----------------------
      case Routes.adminCategory:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: instance<CategoryCubit>(),
            child: const CategoryView(),
          ),
        );

      case Routes.addCategoryScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: instance<CategoryCubit>(),
            child: AddNewCategory(),
          ),
        );

      // ---------------------- ADMINS -----------------------
      case Routes.admin:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => instance<AdminsCubit>(),
            child: const AdminsScreen(),
          ),
        );

      // ---------------------- PROFILE -----------------------
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => instance<LogOutCubit>()),
              BlocProvider(
                create: (_) =>
                    instance<AuthenticationWithGoogleAndAppleCubit>(),
              ),
            ],
            child: const ProfileView(),
          ),
        );

      // ---------------------- DRIVERS -----------------------
      case Routes.adminDrivers:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => instance<DriverCubit>(),
            child: const AdminDriversScreen(),
          ),
        );

      // ---------------------- ADMIN PRODUCT -----------------------

      case Routes.adminProduct:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => instance<AdminProductCubit>()),
              BlocProvider(create: (_) => instance<SubCategoriesCubit>()),
            ],
            child: const AdminProductScreen(),
          ),
        );

      case Routes.addProduct:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: instance<AdminProductCubit>()),
              BlocProvider(create: (context) => instance<SubCategoriesCubit>()),
            ],
            child: const AddProductScreen(),
          ),
        );

      // ---------------------- STORE ADDRESS -----------------------
      case Routes.storeAddress:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => instance<StoreAddressCubit>(),
            child: const StoreAddressScreen(),
          ),
        );

      // ---------------------- REGISTER -----------------------
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => instance<SignUpBloc>(),
            child: const SignUpView(),
          ),
        );

      // ---------------------- FORGET PASSWORD -----------------------
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

      // ---------------------- ADDRESS -----------------------
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
              BlocProvider.value(value: instance<UserAddressCubit>()),
              BlocProvider.value(value: instance<PaymentCubit>()),
              BlocProvider.value(value: instance<MapCubit>()),
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

      // ---------------------- ADMIN MENU -----------------------
      case Routes.adminMenue:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => instance<AdminHomeCubit>()),
              BlocProvider.value(value: instance<CartCubit>()),
              BlocProvider.value(value: instance<CategoryCubit>()), // FIXED
              BlocProvider(create: (_) => instance<LogOutCubit>()),
            ],
            child: const DrawerStackView(),
          ),
        );

      // ---------------------- ADMIN BANNER -----------------------
      case Routes.adminBanner:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => instance<BannerCubit>(),
            child: const BannerScreen(),
          ),
        );

      // ---------------------- ADMIN SUBCATEGORY -----------------------
      case Routes.adminSubCategory:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => instance<SubCategoriesCubit>()),
              BlocProvider.value(value: instance<CategoryCubit>()), // FIXED
            ],
            child: const AdminSubCategoryScreen(),
          ),
        );

      case Routes.addSubCategoryScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: instance<SubCategoriesCubit>()),
              BlocProvider.value(value: instance<CategoryCubit>()), // FIXED
            ],
            child: AddNewSubCategory(),
          ),
        );

      // ---------------------- ACCOUNT INFO -----------------------
      case Routes.accountInfomation:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => instance<AccountInformationCubit>()),
              BlocProvider(
                create: (_) =>
                    instance<AuthenticationWithGoogleAndAppleCubit>(),
              ),
            ],
            child: const AccountInfomation(),
          ),
        );

      case Routes.changeMyEmail:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => instance<ChangeEmailAddressCubit>(),
            child: const ChangeEmailScreen(),
          ),
        );

      case Routes.changeMyPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => instance<ChangeMyPasswordCubit>(),
            child: const ChangePasswordScreen(),
          ),
        );

      // ---------------------- USER BOTTOM NAV -----------------------
      case Routes.bottomNavBarRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: instance<UserAddressCubit>()),
              BlocProvider.value(value: instance<LogOutCubit>()),
              BlocProvider(create: (_) => instance<BannerCubit>()),
              BlocProvider.value(value: instance<CategoryCubit>()), // FIXED
              BlocProvider.value(value: instance<MapCubit>()),
              BlocProvider.value(value: instance<CartCubit>()),
              BlocProvider.value(value: instance<ProductCubit>()),
              BlocProvider.value(value: instance<WishListCubit>()),
            ],
            child: const BottomNavBar(),
          ),
        );

      // ---------------------- NEW PRODUCT -----------------------
      case Routes.newProduct:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: instance<CartCubit>()),
              BlocProvider.value(value: instance<ProductCubit>()),
              BlocProvider.value(value: instance<WishListCubit>()),
            ],
            child: const NewProductView(),
          ),
        );

      // ---------------------- NOTIFICATION -----------------------
      case Routes.notification:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => instance<UserNotificationCubit>(),
            child: const UserNotificationScreen(),
          ),
        );

      // ---------------------- ORDERS -----------------------
      case Routes.newOrders:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => instance<AdminHomeCubit>(),
            child: const NewOrders(),
          ),
        );

      case Routes.completeOrders:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => instance<AdminHomeCubit>(),
            child: const CompleteOrdersView(),
          ),
        );

      case Routes.cancelledOrders:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => instance<AdminHomeCubit>(),
            child: const CancelledOrders(),
          ),
        );

      case Routes.deliveredOrders:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => instance<AdminHomeCubit>(),
            child: const DeliverdOrders(),
          ),
        );

      case Routes.pendingDrivers:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => instance<AdminHomeCubit>(),
            child: const PendingDriver(),
          ),
        );

      case Routes.pendingOrders:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => instance<AdminHomeCubit>(),
            child: const PendingOrders(),
          ),
        );

      // ---------------------- ORDER PLACED / DETAILS -----------------------
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
          ),
        );

      case Routes.wishList:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: instance<CartCubit>()),
              BlocProvider.value(value: instance<ProductCubit>()),
              BlocProvider.value(value: instance<WishListCubit>()),
            ],
            child: const WishListView(),
          ),
        );

      case Routes.cart:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: instance<UserAddressCubit>()),
              BlocProvider.value(value: instance<CartCubit>()),
            ],
            child: const CartView(),
          ),
        );

      // ---------------------- SEARCH -----------------------
      case Routes.search:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: instance<SearchBloc>(),
            child: const SearchView(),
          ),
        );

      // ---------------------- SHIPPING -----------------------
      case Routes.shippingAddress:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: instance<MapCubit>()),
              BlocProvider.value(value: instance<PaymentCubit>()),
              BlocProvider.value(value: instance<UserAddressCubit>()),
            ],
            child: const ShippingAddress(),
          ),
        );

      case Routes.shippingPayment:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: instance<PaymentCubit>()),
              BlocProvider.value(value: instance<CartCubit>()),
            ],
            child: const PaymentScreen(),
          ),
        );

      case Routes.shippingReviewScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: instance<PaymentCubit>()),
              BlocProvider.value(value: instance<CartCubit>()),
              BlocProvider.value(value: instance<UserAddressCubit>()),
            ],
            child: const ReviewPaymentScreen(),
          ),
        );

      // ---------------------- DEFAULT -----------------------
      case Routes.noRoute:
        return MaterialPageRoute(builder: (_) => const RouteStatesScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text(context.translate(AppStrings.noRouteFound))),
        body: Center(child: Text(context.translate(AppStrings.noRouteFound))),
      ),
    );
  }
}
