import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/sharedWidget/custom_button.dart';
import '../../../../core/common/toast/show_toast.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/fonts/strings_manger.dart';
import '../../../../core/utils/app_regex.dart';
import '../../cubit/change_my_password_cubit.dart';

class ChangeUserPasswordBody extends StatelessWidget {
  const ChangeUserPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 18.w, right: 18.w, top: 30.h, bottom: 50.h),
      child: Form(
        key: context.read<ChangeMyPasswordCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              obscureText: !context
                  .watch<ChangeMyPasswordCubit>()
                  .isCurrentPasswordVisible,
              controller: context
                  .read<ChangeMyPasswordCubit>()
                  .currentPasswordController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPasswordValid(value)) {
                  return 'Please enter a valid password';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Current User Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    context
                            .watch<ChangeMyPasswordCubit>()
                            .isCurrentPasswordVisible
                        ? IconlyBroken.show
                        : IconlyBroken.hide,
                    size: 22.sp,
                    color: ColorManger.brunLight,
                  ),
                  onPressed: () {
                    context
                        .read<ChangeMyPasswordCubit>()
                        .togglePasswordVisibility('current');
                  },
                ),
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
            SizedBox(
              height: 15.h,
            ),
            TextFormField(
              obscureText:
                  !context.watch<ChangeMyPasswordCubit>().isPasswordVisible,
              style: TextStyle(color: ColorManger.brunLight),
              controller:
                  context.read<ChangeMyPasswordCubit>().passwordController,
              onChanged: (value) {
                context.read<ChangeMyPasswordCubit>().validatePassword(value);
              },
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPasswordValid(value)) {
                  return 'Please enter a valid password';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'New User Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    context.watch<ChangeMyPasswordCubit>().isPasswordVisible
                        ? IconlyBroken.show
                        : IconlyBroken.hide,
                    size: 22.sp,
                    color: ColorManger.brunLight,
                  ),
                  onPressed: () {
                    context
                        .read<ChangeMyPasswordCubit>()
                        .togglePasswordVisibility('new');
                  },
                ),
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
            SizedBox(
              height: 15.h,
            ),
            TextFormField(
              obscureText: !context
                  .watch<ChangeMyPasswordCubit>()
                  .isPasswordConfirmVisible,
              style: TextStyle(color: ColorManger.brunLight),
              controller: context
                  .read<ChangeMyPasswordCubit>()
                  .passwordConfirmController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPasswordValid(value)) {
                  return 'Please enter a valid password';
                } else if (value.trim() !=
                    context
                        .read<ChangeMyPasswordCubit>()
                        .passwordController
                        .text
                        .trim()) {
                  return 'new password And Confirm Password Not Matching';
                }
                return null;
              },
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
                suffixIcon: IconButton(
                  icon: Icon(
                    context
                            .watch<ChangeMyPasswordCubit>()
                            .isPasswordConfirmVisible
                        ? IconlyBroken.show
                        : IconlyBroken.hide,
                    size: 22.sp,
                    color: ColorManger.brunLight,
                  ),
                  onPressed: () {
                    context
                        .read<ChangeMyPasswordCubit>()
                        .togglePasswordVisibility('confirm');
                  },
                ),
                fillColor: ColorManger.backgroundItem,
                hintStyle: TextStyle(color: ColorManger.brunLight),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            _instructionsTextColumn(context),
            SizedBox(
              height: 50.h,
            ),
            _submitPasswordChangeButton(context)
          ],
        ),
      ),
    );
  }

  BlocBuilder _submitPasswordChangeButton(BuildContext context) {
    return BlocBuilder<ChangeMyPasswordCubit, ChangeMyPasswordState>(
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (context
                .read<ChangeMyPasswordCubit>()
                .formKey
                .currentState!
                .validate()) {
              context.read<ChangeMyPasswordCubit>().submitPasswordChange();
            }
          },
          radius: 8.r,
          widget: state.maybeWhen(
            changeMyPasswordLoading: () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.0,
                    strokeAlign: 0.01,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  AppStrings.loading,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16.sp,
                      color: ColorManger.white,
                      fontWeight: FontWeightManger.semiBold),
                ),
              ],
            ),
            orElse: () => Text(
              "Submit",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 16.sp,
                  color: ColorManger.white,
                  fontWeight: FontWeightManger.semiBold),
            ),
          ),
        );
      },
    );
  }

  BlocConsumer _instructionsTextColumn(BuildContext context) {
    return BlocConsumer<ChangeMyPasswordCubit, ChangeMyPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
            changeMyPasswordError: (statesCode, errorMessage) =>
                ShowToast.showToastErrorTop(
                    errorMessage: errorMessage, context: context),
            changeMyPasswordSuccess: (data) {
              ShowToast.showToastSuccessTop(
                  message: data.message!, context: context);
            });
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password must be at least 8 Characters and should include:",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color:
                        context.read<ChangeMyPasswordCubit>().lengthTextColor,
                    fontSize: 12.sp),
              ),
              SizedBox(height: 15.h),
              Text(
                ". 1 upperCase letter (A-Z)",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: context
                        .read<ChangeMyPasswordCubit>()
                        .upperCaseTextColor,
                    fontSize: 12.sp),
              ),
              SizedBox(height: 15.h),
              Text(
                ". 1 lowerCase letter (a-z)",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: context
                        .read<ChangeMyPasswordCubit>()
                        .lowerCaseTextColor,
                    fontSize: 12.sp),
              ),
              SizedBox(height: 15.h),
              Text(
                ". 1 number (0-9)",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color:
                        context.read<ChangeMyPasswordCubit>().numberTextColor,
                    fontSize: 12.sp),
              ),
              SizedBox(height: 15.h),
              Text(
                ". 1 special character (-@#\\\$%^&*_-+=,.?/)",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: context
                        .read<ChangeMyPasswordCubit>()
                        .specialCharTextColor,
                    fontSize: 12.sp),
              ),
            ],
          ),
        );
      },
    );
  }
}
