import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              tap: () {},
            ),
            CustomProfileCard(
              title: "My Address",
              leadingIcon: IconlyBold.location,
              tap: () {},
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
            CustomProfileCard(
              title: "Log Out",
              leadingIcon: IconlyBold.logout,
              tap: () {},
            ),
          ],
        ),
      );
  }
}
