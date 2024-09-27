import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/style/color/color_manger.dart';
import 'custom_profile_card.dart';

void chaneProfileDataBottomSheet(BuildContext context) {
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
