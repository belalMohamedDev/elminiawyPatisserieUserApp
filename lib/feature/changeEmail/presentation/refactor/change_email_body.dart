import 'package:elminiawy/core/style/color/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/sharedWidget/custom_button.dart';
import '../../../../core/style/fonts/font_manger.dart';

class ChangeEmailBody extends StatelessWidget {
  const ChangeEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
            child: TextFormField(
              // controller:
              //     context.read<AccountInformationCubit>().userNameController,

              decoration: InputDecoration(
                hintText: 'New Email Address',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManger.backgroundItem,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManger.backgroundItem,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                ),
                prefixIcon: Icon(IconlyBroken.message,
                    size: 18.sp, color: ColorManger.brunLight),
                fillColor: ColorManger.backgroundItem,
                hintStyle: TextStyle(color: ColorManger.brunLight),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 50.h,
            child: TextFormField(
              style: TextStyle(color: ColorManger.brunLight),
              // controller:
              //     context.read<AccountInformationCubit>().userNameController,

              decoration: InputDecoration(
                hintText: 'Confirm New Email Address',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManger.backgroundItem,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManger.backgroundItem,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                ),
                prefixIcon: Icon(IconlyBroken.message,
                    size: 18.sp, color: ColorManger.brunLight),
                fillColor: ColorManger.backgroundItem,
                hintStyle: TextStyle(color: ColorManger.brunLight),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 50.h,
            child: TextFormField(
              style: TextStyle(color: ColorManger.brunLight),
              // controller:
              //     context.read<AccountInformationCubit>().userNameController,

              decoration: InputDecoration(
                hintText: 'Current Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManger.backgroundItem,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManger.backgroundItem,
                  ),
                  borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                ),
                prefixIcon: Icon(IconlyBroken.lock,
                    size: 18.sp, color: ColorManger.brunLight),
                suffixIcon: Icon(IconlyBroken.show,
                    size: 22.sp, color: ColorManger.brunLight),
                fillColor: ColorManger.backgroundItem,
                hintStyle: TextStyle(color: ColorManger.brunLight),
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomButton(
            onPressed: () {},
            radius: 10.r,
            widget: Text(
              "Submit",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 16.sp,
                  color: ColorManger.white,
                  fontWeight: FontWeightManger.semiBold),
            ),
          )
        ],
      ),
    );
  }
}
