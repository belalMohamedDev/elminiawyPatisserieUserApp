import 'package:elminiawy/feature/profile/presentation/widget/chane_profile_data_bottom_sheet.dart';
import 'package:elminiawy/feature/profile/presentation/widget/log_out_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../cubit/log_out_cubit.dart';
import 'custom_profile_card.dart';
import 'setting_change_bottom_sheet.dart';

BlocBuilder profileColumnCard(BuildContext context) {
  return BlocBuilder<LogOutCubit, LogOutState>(
    builder: (context, state) {
      bool initUserNameCheck =
          context.read<LogOutCubit>().initialUserName == 'Guest User';
      return Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                CustomProfileCard(
                  title: "My Profile",
                  leadingIcon: IconlyBold.profile,
                  tap: initUserNameCheck
                      ? () {
                          context.read<LogOutCubit>().logInSnackBar(context);
                        }
                      : () {
                          chaneProfileDataBottomSheet(context);
                        },
                ),
                CustomProfileCard(
                  title: "My Address",
                  leadingIcon: IconlyBold.location,
                  tap: initUserNameCheck
                      ? () {
                          context.read<LogOutCubit>().logInSnackBar(context);
                        }
                      : () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushNamed(Routes.address);
                        },
                ),
                CustomProfileCard(
                  title: "My Orders",
                  leadingIcon: IconlyBold.bag,
                  tap: initUserNameCheck
                      ? () {
                          context.read<LogOutCubit>().logInSnackBar(context);
                        }
                      : () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushNamed(Routes.myOrder);
                        },
                ),
                CustomProfileCard(
                  title: "My WishList",
                  leadingIcon: IconlyBold.heart,
                  tap: initUserNameCheck
                      ? () {
                          context.read<LogOutCubit>().logInSnackBar(context);
                        }
                      : () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushNamed(Routes.wishList);
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
