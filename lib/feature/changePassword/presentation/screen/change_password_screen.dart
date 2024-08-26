import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/sharedWidget/custom_button.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Change User Password",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: const ChangeUserPasswordBody(),
    );
  }
}

class ChangeUserPasswordBody extends StatelessWidget {
  const ChangeUserPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 18.w, right: 18.w, top: 30.h, bottom: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
            child: TextFormField(
              // controller:
              //     context.read<AccountInformationCubit>().userNameController,

              decoration: InputDecoration(
                hintText: 'Current User Password',
                suffixIcon: Icon(IconlyBroken.show,
                    size: 22.sp, color: ColorManger.brunLight),
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
                hintText: 'New User Password',
                suffixIcon: Icon(IconlyBroken.show,
                    size: 22.sp, color: ColorManger.brunLight),
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
                hintText: 'Confirm New User Password',
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
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Password must be at least 8 Characters and should incloude:",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.brunLight,
                        fontSize: 12.sp)),
                SizedBox(
                  height: 15.h,
                ),
                Text(". 1 upperCase letter (A-Z)",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.brunLight,
                        fontSize: 12.sp)),
                SizedBox(
                  height: 15.h,
                ),
                Text(". 1 lowerCase letter (a-z)",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.brunLight,
                        fontSize: 12.sp)),
                SizedBox(
                  height: 15.h,
                ),
                Text(". 1 number letter (0-9)",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.brunLight,
                        fontSize: 12.sp)),
                SizedBox(
                  height: 15.h,
                ),
                Text(". 1 special character (-@#\\\$%^&*_-+=,.?/)",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.brunLight,
                        fontSize: 12.sp)),
              ],
            ),
          ),
          const Spacer(),
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
