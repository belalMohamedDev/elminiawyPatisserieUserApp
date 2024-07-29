import 'package:elminiawy/core/style/color/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/images/asset_manger.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileBody(),
    );
  }
}

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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: const Column(
            children: [
              CustomProfileCard(
                title: "My Profile",
                leadingIcon: IconlyBold.profile,
              ),
              CustomProfileCard(
                title: "My Address",
                leadingIcon: IconlyBold.location,
              ),
              CustomProfileCard(
                title: "My Orders",
                leadingIcon: IconlyBold.bag,
              ),
              CustomProfileCard(
                title: "My WishList",
                leadingIcon: IconlyBold.heart,
              ),
              CustomProfileCard(
                title: "Settings",
                leadingIcon: IconlyBold.setting,
              ),
              CustomProfileCard(
                title: "Log Out",
                leadingIcon: IconlyBold.logout,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomProfileCard extends StatelessWidget {
  final String title;
  final IconData leadingIcon;

  const CustomProfileCard({
    super.key,
    required this.title,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: ColorManger.backgroundItem),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Icon(
              leadingIcon,
              color: ColorManger.brun,
              size: 16.sp,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.brun,
                    fontSize: 12.sp)),
            const Spacer(),
            Icon(
              IconlyBold.arrowRight,
              color: ColorManger.brun,
              size: 16.sp,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          color: ColorManger.backgroundItem,
        ),
      ],
    );
  }
}
