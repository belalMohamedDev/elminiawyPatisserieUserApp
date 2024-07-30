import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/sharedWidget/custom_button.dart';
import '../../../../core/common/toast/show_toast.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/fonts/strings_manger.dart';
import '../../bloc/sign_up_bloc.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        state.whenOrNull(
            error: (statesCode, errorMessage) => ShowToast.showToastErrorTop(
                errorMessage: errorMessage, context: context),
            suceess: (data) {
              ShowToast.showToastSuccessTop(
                  message: data.message!, context: context);
              context.pushReplacementNamed(Routes.bottomNavBarRoute);
            });
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: context.read<SignUpBloc>().isButtonInVaildator
              ? () {
                  context
                      .read<SignUpBloc>()
                      .add(const UserRegisterButtonEvent());
                }
              : null,
          widget: state.maybeWhen(
            loading: () => Row(
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
              AppStrings.signUp,
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



