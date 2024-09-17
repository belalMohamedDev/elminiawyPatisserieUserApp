import 'package:elminiawy/core/routing/routes.dart';
import 'package:elminiawy/feature/logOut/cubit/log_out_cubit.dart';
import 'package:elminiawy/feature/order/presentation/screen/my_orders_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/application/cubit/app_logic_cubit.dart';
import '../../../../core/common/toast/show_toast.dart';
import '../../../../core/services/shared_pref_helper.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/images/asset_manger.dart';
import '../../../../core/utils/persistent_nav_bar_navigator.dart.dart';
import '../../../wishList/presentation/screen/wishlist_screen.dart';
import '../widget/custom_profile_card.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.h,
          color: ColorManger.brun,
          child: BlocBuilder<LogOutCubit, LogOutState>(
            builder: (context, state) {
              return Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  context.read<LogOutCubit>().initialUserName == 'Guest User'
                      ? Image.asset(
                          ImageAsset.guestIconGreen,
                          color: ColorManger.white,
                          height: 100.h,
                        )
                      : Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              color: Colors.white70),
                          child: Center(
                            child: Text(
                                context
                                    .read<LogOutCubit>()
                                    .initialUserName[0]
                                    .toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
                                        color: ColorManger.brun,
                                        fontSize: 60.sp)),
                          ),
                        ),
                  SizedBox(
                    width: 20.w,
                  ),
                  context.read<LogOutCubit>().initialUserName == 'Guest User'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Guest User",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
                                        color: Colors.white70,
                                        fontSize: 12.sp)),
                            Text("Login to View all the features",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
                                        color: Colors.white60,
                                        fontSize: 12.sp)),
                          ],
                        )
                      : Text(
                          "Welcome back! Let's achieve\n great things today!",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontFamily: FontConsistent.fontFamilyAcme,
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                  ),
                        ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        _profileColumnCard(context),
      ],
    );
  }

  BlocBuilder _profileColumnCard(BuildContext context) {
    return BlocBuilder<LogOutCubit, LogOutState>(
      builder: (context, state) {
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
                    tap: () {
                      _chaneProfileDataaBottomSheet(context);
                    },
                  ),
                  CustomProfileCard(
                    title: "My Address",
                    leadingIcon: IconlyBold.location,
                    tap: () {
                      Navigator.of(context, rootNavigator: !false)
                          .pushNamed(Routes.address);
                    },
                  ),
                  CustomProfileCard(
                    title: "My Orders",
                    leadingIcon: IconlyBold.bag,
                    tap: () {
                      NavBarNavigator.push(context,
                          screen: const MyOrdersScreen(), withNavBar: false);
                    },
                  ),
                  CustomProfileCard(
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
                      _settingChangeBottomSheet(context);
                    },
                  ),
                  _logoutLogic(context)
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

  Future<dynamic> _settingChangeBottomSheet(BuildContext context) {
    return showCupertinoModalBottomSheet(
        useRootNavigator: true,
        barrierColor: Colors.black54,
        elevation: 20.r,
        context: context,
        builder: (context) => SizedBox(
              height: 400.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 35.h),
                child: Material(
                  color: ColorManger.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomProfileCard(
                          title: "Notification",
                          actionWidget: Transform.scale(
                            scale: 0.75,
                            child: CupertinoSwitch(
                              value: false,
                              activeColor: ColorManger.brun,
                              onChanged: (value) {},
                            ),
                          ),
                          leadingIcon: IconlyBold.notification,
                          tap: () {},
                        ),
                        CustomProfileCard(
                          title: "Location",
                          actionWidget: Transform.scale(
                            scale: 0.75,
                            child: CupertinoSwitch(
                              value: true,
                              activeColor: ColorManger.brun,
                              onChanged: (value) {},
                            ),
                          ),
                          leadingIcon: IconlyBold.location,
                          tap: () {},
                        ),
                        CustomProfileCard(
                          title: "Language",
                          subTitle: 'English',
                          leadingIcon: Icons.language,
                          tap: () {},
                        ),
                        CustomProfileCard(
                          title: "Dark Mode",
                          leadingIcon: Icons.light_mode,
                          tap: () {},
                          actionWidget: Transform.scale(
                            scale: 0.75,
                            child: CupertinoSwitch(
                              value: false,
                              activeColor: ColorManger.brun,
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  BlocListener<LogOutCubit, LogOutState> _logoutLogic(BuildContext context) {
    return BlocListener<LogOutCubit, LogOutState>(
      listener: (context, state) async {
        if (state is LogOutSuccess) {
          ShowToast.showToastSuccessTop(
              message: state.successMessage, context: context);
          await SharedPrefHelper.clearAllSecuredData();

          if (context.mounted) {
            Navigator.of(context, rootNavigator: !false)
                .pushNamedAndRemoveUntil(
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
        tap: () async {
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

  void _chaneProfileDataaBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
        useRootNavigator: true,
        barrierColor: Colors.black54,
        elevation: 20.r,
        context: context,
        builder: (context) => SizedBox(
              height: 300.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 35.h),
                child: Material(
                  color: ColorManger.white,
                  child: Column(
                    children: [
                      CustomProfileCard(
                        title: "Account Information",
                        leadingIcon: IconlyBold.infoCircle,
                        tap: () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushReplacementNamed(Routes.accountInfomation);
                        },
                      ),
                      CustomProfileCard(
                        title: "Change Email Address",
                        leadingIcon: IconlyBold.message,
                        tap: () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushReplacementNamed(Routes.changeMyEmail);
                        },
                      ),
                      CustomProfileCard(
                        title: "Change Password",
                        leadingIcon: IconlyBold.lock,
                        tap: () {
                          Navigator.of(context, rootNavigator: !false)
                              .pushReplacementNamed(Routes.changeMyPassword);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
