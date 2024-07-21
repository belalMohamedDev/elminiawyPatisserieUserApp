import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../core/application/di.dart';
import '../../../core/style/color/color_manger.dart';
import '../../../core/style/fonts/strings_manger.dart';
import '../../cart/presentation/screen/category_view.dart';
import '../../category/presentation/screen/cart_view.dart';
import '../../home/logic/cubit/home_cubit.dart';
import '../../home/presentation/screen/home_screen.dart';
import '../../profile/presentation/screen/profile_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PersistentTabController bottomNavBarController =
      PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: bottomNavBarController,
      margin: const EdgeInsets.all(12.0),

      backgroundColor: ColorManger.brun, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,

      screenTransitionAnimation: const ScreenTransitionAnimation(
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),

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
          //  padding: const EdgeInsets.all(12.0),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)),
        ),
      ), // Choose the nav bar style with this property.
    );
  }

  List<PersistentTabConfig> _navBarsItems() {
    return [
      PersistentTabConfig(
        screen: BlocProvider(
          create: (context) => instance<HomeCubit>(),
          child: const HomeScreen(),
        ),
        item: ItemConfig(
          icon: Icon(IconlyBroken.home, size: 20.sp),
          title: (AppStrings.home),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brun,
        ),
      ),
      PersistentTabConfig(
        screen: const CategoryView(),
        item: ItemConfig(
          icon: Icon(IconlyBroken.category, size: 20.sp),
          title: (AppStrings.categories),
          activeForegroundColor: ColorManger.brun,
          inactiveForegroundColor: ColorManger.brunLight,
        ),
      ),
      PersistentTabConfig(
        screen: const CartView(),
        item: ItemConfig(
          icon: Icon(IconlyBroken.bag, size: 20.sp),
          title: (AppStrings.shopping),
          activeForegroundColor: ColorManger.white,
          inactiveForegroundColor: ColorManger.brunLight,
        ),
      ),
      PersistentTabConfig(
        screen: const ProfileView(),
        item: ItemConfig(
          icon: Icon(IconlyBroken.setting, size: 20.sp),
          title: (AppStrings.profile),
          activeForegroundColor: ColorManger.white,
          inactiveForegroundColor: ColorManger.brunLight,
        ),
      ),
    ];
  }
}
