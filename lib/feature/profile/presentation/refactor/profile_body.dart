import 'package:elminiawy/core/routing/routes.dart';
import 'package:elminiawy/feature/logOut/cubit/log_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/toast/show_toast.dart';
import '../../../../core/services/shared_pref_helper.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/images/asset_manger.dart';
import '../../../../core/utils/persistent_nav_bar_navigator.dart.dart';
import '../../../wishList/presentation/screen/wishlist_screen.dart';
import '../widget/custom_profile_card.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.h,
          color: ColorManger.brun,
          child: Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Image.asset(
                ImageAsset.guestIconGreen,
                color: ColorManger.white,
                height: 80.h,
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Guest User",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: Colors.white70,
                          fontSize: 12.sp)),
                  Text("Login to View all the features",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: Colors.white60,
                          fontSize: 12.sp)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        _profileColumnCard(context),
      ],
    );
  }

  Padding _profileColumnCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        children: [
          CustomProfileCard(
            title: "My Profile",
            leadingIcon: IconlyBold.profile,
            tap: () {
              Navigator.of(context, rootNavigator: !false)
                  .pushNamed(Routes.accountInfomation);
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
            tap: () {},
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
            tap: () {},
          ),
          BlocListener<LogOutCubit, LogOutState>(
            listener: (context, state) async {
              if (state is LogOutSuccess) {
                ShowToast.showToastSuccessTop(
                    message: state.successMessage, context: context);
                await SharedPrefHelper.clearAllSecuredData();

                if (context.mounted) {
                  Navigator.of(context, rootNavigator: !false)
                      .pushNamedAndRemoveUntil(
                          Routes.loginRoute, (Route route) => false);
                }
              } else if (state is LogOutError) {
                ShowToast.showToastErrorTop(
                    errorMessage: state.errorMessage, context: context);
              }
            },
            child: CustomProfileCard(
              title: "Log Out",
              leadingIcon: IconlyBold.logout,
              tap: () async {
                context.read<LogOutCubit>().checkTokenThenDoLogOut(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
