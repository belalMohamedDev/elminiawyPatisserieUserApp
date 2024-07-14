import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../forgetPassword/bloc/forget_password_bloc.dart';

class VerifyCodeTextFormField extends StatelessWidget {
  const VerifyCodeTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VerificationCode(
      textStyle:
          Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18.sp),
      keyboardType: TextInputType.text,
      underlineColor: ColorManger.primary,
      fullBorder: true,
      margin: const EdgeInsets.all(2),
      length: 6,
      itemSize: 40.spMax,
      cursorColor: ColorManger.primary,
      onCompleted: (String value) {
        context
            .read<ForgetPasswordBloc>()
            .add(UserForgetPasswordOTPButtonEvent(value));
      },
      onEditing: (bool value) {},
    );
  }
}
