import 'package:elminiawy/feature/profile/presentation/widget/chane_profile_data_bottom_sheet.dart';
import 'package:elminiawy/feature/profile/presentation/widget/log_out_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/utils/persistent_nav_bar_navigator.dart.dart';
import '../../cubit/log_out_cubit.dart';
import '../../../order/presentation/screen/my_orders_screen.dart';
import '../../../wishList/presentation/screen/wishlist_screen.dart';
import 'custom_profile_card.dart';
import 'setting_change_bottom_sheet.dart';

BlocBuilder profileColumnCard(BuildContext context) {
  return BlocBuilder<LogOutCubit, LogOutState>(
    builder: (context, state) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                context.read<LogOutCubit>().initialUserToken == 'Guest User'
                    ? const SizedBox()
                    : CustomProfileCard(
                        title: "My Profile",
                        leadingIcon: IconlyBold.profile,
                        tap: () {
                          chaneProfileDataBottomSheet(context);
                        },
                      ),
                context.read<LogOutCubit>().initialUserToken == 'Guest User'
                    ? const SizedBox()
                    : CustomProfileCard(
                        title: "My Address",
                        leadingIcon: IconlyBold.location,
                        tap: () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushNamed(Routes.address);
                        },
                      ),
                context.read<LogOutCubit>().initialUserToken == 'Guest User'
                    ? const SizedBox()
                    : CustomProfileCard(
                        title: "My Orders",
                        leadingIcon: IconlyBold.bag,
                        tap: () {
                          NavBarNavigator.push(context,
                              screen: const MyOrdersScreen(),
                              withNavBar: false);
                        },
                      ),
                context.read<LogOutCubit>().initialUserToken == 'Guest User'
                    ? const SizedBox()
                    : CustomProfileCard(
                        title: "My WishList",
                        leadingIcon: IconlyBold.heart,
                        tap: () {
                          NavBarNavigator.push(context,
                              screen: const WishListView(), withNavBar: false);
                        },
                      ),
                CustomProfileCard(
                  title: "Settings",
                  leadingIcon: IconlyBold.setting,
                  tap: () {
                    settingChangeBottomSheet(context);
                  },
                ),
                logoutLogic(context)
              ],
            ),
          ),
          if (state is LogOutLoading)
            Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                    color: ColorManger.brun,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.r),
                    child: CircularProgressIndicator(
                      color: ColorManger.white,
                      strokeWidth: 3.sp,
                    ),
                  ),
                )),
        ],
      );
    },
  );
}
