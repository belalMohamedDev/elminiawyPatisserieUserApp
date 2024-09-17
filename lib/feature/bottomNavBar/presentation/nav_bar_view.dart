import 'package:elminiawy/core/application/cubit/app_logic_cubit.dart';
import 'package:elminiawy/feature/logOut/cubit/log_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../core/application/di.dart';
import '../../../core/style/color/color_manger.dart';
import '../../../core/style/fonts/strings_manger.dart';
import '../../../core/utils/persistent_nav_bar_navigator.dart.dart';
import '../../address/logic/userAddressCubit/user_address_cubit.dart';
import '../../cart/cubit/cart_cubit.dart';
import '../../category/presentation/screen/category_view.dart';
import '../../cart/presentation/screen/cart_view.dart';
import '../../home/logic/bannerCubit/banner_cubit.dart';
import '../../home/logic/categoryCubit/category_cubit.dart';
import '../../home/presentation/screen/home_screen.dart';
import '../../newProduct/Cubit/product_cubit.dart';
import '../../profile/presentation/screen/profile_view.dart';
import '../../wishList/cubit/wish_list_cubit.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        context.read<BannerCubit>().getBanners(),
        context.read<CategoryCubit>().getCategories(),
        context.read<ProductCubit>().getProduct(),
        context.read<UserAddressCubit>().getUserAddress(),
        context.read<CartCubit>().getCartItem(),
        context.read<WishListCubit>().getWishList(),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLogicCubit, AppLogicState>(
      builder: (context, state) {
        return PersistentTabView(
          avoidBottomPadding: false,
          stateManagement: false,

          controller: context.read<AppLogicCubit>().bottomNavBarController,

          margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),

          backgroundColor: ColorManger.brun,

          screenTransitionAnimation: const ScreenTransitionAnimation(
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),

          onTabChanged: (index) {
            if (index == 2) {
              NavBarNavigator.push(context,
                  screen: const CartView(), withNavBar: false);
              context.read<AppLogicCubit>().bottomNavBarController.jumpToTab(0);
            }
          },

          tabs: _navBarsItems(),

          navBarBuilder: (navBarConfig) => Style8BottomNavBar(
            navBarConfig: navBarConfig,
            itemAnimationProperties: const ItemAnimation(
              //   // Screen transition animation on change of selected tab.

              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarDecoration: NavBarDecoration(
              color: ColorManger.backgroundItem,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
            ),
          ), // Choose the nav bar style with this property.
        );
      },
    );
  }

  List<PersistentTabConfig> _navBarsItems() {
    return [
      PersistentTabConfig(
        screen: const HomeScreen(),
        item: ItemConfig(
          icon: Icon(IconlyBold.home, size: 20.sp),
          inactiveIcon: Icon(IconlyBroken.home, size: 20.sp),
          title: (AppStrings.home),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
      PersistentTabConfig(
        screen: const CategoryView(),
        item: ItemConfig(
          icon: Icon(IconlyBold.category, size: 20.sp),
          inactiveIcon: Icon(IconlyBroken.category, size: 20.sp),
          title: (AppStrings.categories),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
      PersistentTabConfig(
        screen: Container(),
        item: ItemConfig(
          icon: Icon(IconlyBold.bag, size: 20.sp),
          inactiveIcon: Icon(IconlyBroken.bag, size: 20.sp),
          title: (AppStrings.shopping),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
      PersistentTabConfig(
        screen: BlocProvider(
          create: (context) => instance<LogOutCubit>(),
          child: const ProfileView(),
        ),
        item: ItemConfig(
          icon: Icon(IconlyBold.setting, size: 20.sp),
          inactiveIcon: Icon(IconlyBroken.setting, size: 20.sp),
          title: (AppStrings.profile),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
    ];
  }
}
