import 'package:elminiawy/core/style/color/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/application/cubit/app_logic_cubit.dart';
import '../../../../core/common/toast/show_toast.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/services/shared_pref_helper.dart';
import '../../cubit/log_out_cubit.dart';
import 'custom_profile_card.dart';

BlocListener<LogOutCubit, LogOutState> logoutLogic(BuildContext context) {
  return BlocListener<LogOutCubit, LogOutState>(
    listener: (context, state) async {
      if (state is LogOutSuccess) {
        ShowToast.showToastSuccessTop(
            message: state.successMessage, context: context);
        await SharedPrefHelper.clearAllSecuredData();

        if (context.mounted) {
          Navigator.of(context, rootNavigator: !false).pushNamedAndRemoveUntil(
              Routes.loginRoute, (Route route) => false);

          context.read<AppLogicCubit>().bottomNavBarController.jumpToTab(0);
        }
      } else if (state is LogOutError) {
        ShowToast.showToastErrorTop(
            errorMessage: state.errorMessage, context: context);
        if (state.statesCode == 400) {
          await SharedPrefHelper.clearAllSecuredData();

          if (context.mounted) {
            Navigator.of(context, rootNavigator: !false)
                .pushNamedAndRemoveUntil(
                    Routes.loginRoute, (Route route) => false);

            context.read<AppLogicCubit>().bottomNavBarController.jumpToTab(0);
          }
        }
      }
    },
    child: CustomProfileCard(
      title: "Log Out",
      leadingIcon: IconlyBold.logout,
      tap: context.read<LogOutCubit>().initialUserToken == 'Guest User'
          ? () {
              Navigator.of(context, rootNavigator: !false)
                  .pushNamedAndRemoveUntil(
                      Routes.loginRoute, (Route route) => false);

              context.read<AppLogicCubit>().bottomNavBarController.jumpToTab(0);
            }
          : () async {
              // Show confirmation dialog before logging out
              final shouldLogOut = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    backgroundColor: ColorManger.backgroundItem,
                    contentPadding: EdgeInsets.only(left: 16.w),
                    titlePadding: EdgeInsets.only(top: 25.h, left: 16.w),
                    title: const Text('Confirm Logout'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                          width: 350.w,
                        ),
                        Text('Are you sure you want to log out?',
                            style: TextStyle(
                                fontSize: 15.sp, color: ColorManger.brunLight)),
                      ],
                    ),
                    actionsPadding:
                        EdgeInsets.only(top: 20.h, right: 22.w, bottom: 20.h),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('Cancel',
                            style: TextStyle(
                                fontSize: 15.sp, color: ColorManger.brun)),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        height: 38.h,
                        width: 85.w,
                        decoration: BoxDecoration(
                            color: ColorManger.brun,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text('Log Out',
                                style: TextStyle(
                                    fontSize: 12.sp, color: ColorManger.white)),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );

              // Proceed with logout if confirmed
              if (shouldLogOut == true) {
                context.read<LogOutCubit>().checkTokenThenDoLogOut(context);
              }
            },
    ),
  );
}
