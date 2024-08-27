import 'package:elminiawy/core/style/color/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/sharedWidget/custom_button.dart';
import '../../../../core/common/toast/show_toast.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/fonts/strings_manger.dart';
import '../../../../core/utils/app_regex.dart';
import '../../cubit/change_email_address_cubit.dart';

class ChangeEmailBody extends StatelessWidget {
  const ChangeEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
      child: Form(
        key: context.read<ChangeEmailAddressCubit>().formKey,
        child: Column(
          children: [
            TextFormField(
              controller: context
                  .read<ChangeEmailAddressCubit>()
                  .newEmailAddressController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
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
            SizedBox(
              height: 15.h,
            ),
            TextFormField(
              style: TextStyle(color: ColorManger.brunLight),
              controller: context
                  .read<ChangeEmailAddressCubit>()
                  .confirmNewEmailAddressController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email address';
                } else if (value.trim() !=
                    context
                        .read<ChangeEmailAddressCubit>()
                        .newEmailAddressController
                        .text
                        .trim()) {
                  return 'Email Address And Confirm Email Not Matching';
                }
                return null;
              },
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
            SizedBox(
              height: 15.h,
            ),
            TextFormField(
              obscureText:
                  !context.watch<ChangeEmailAddressCubit>().isPasswordVisible,
              style: TextStyle(color: ColorManger.brunLight),
              controller: context
                  .read<ChangeEmailAddressCubit>()
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
                suffixIcon: IconButton(
                  icon: Icon(
                    context.watch<ChangeEmailAddressCubit>().isPasswordVisible
                        ? IconlyBroken.show
                        : IconlyBroken.hide,
                    size: 22.sp,
                    color: ColorManger.brunLight,
                  ),
                  onPressed: () {
                    context
                        .read<ChangeEmailAddressCubit>()
                        .togglePasswordVisibility();
                  },
                ),
                fillColor: ColorManger.backgroundItem,
                hintStyle: TextStyle(color: ColorManger.brunLight),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            _submitEmailChangeButton(context)
          ],
        ),
      ),
    );
  }

  BlocConsumer _submitEmailChangeButton(BuildContext context) {
    return BlocConsumer<ChangeEmailAddressCubit, ChangeEmailAddressState>(
      listener: (context, state) {
        state.whenOrNull(
            changeEmailAddressError: (statesCode, errorMessage) =>
                ShowToast.showToastErrorTop(
                    errorMessage: errorMessage, context: context),
            changeEmailAddressSuccess: (data) {
              ShowToast.showToastSuccessTop(
                  message: data.message!, context: context);
            });
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (context
                .read<ChangeEmailAddressCubit>()
                .formKey
                .currentState!
                .validate()) {
              context
                  .read<ChangeEmailAddressCubit>()
                  .submitEmailAddressChange();
            }
          },
          radius: 10.r,
          widget: state.maybeWhen(
            changeEmailAddressLoading: () => Row(
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
}
