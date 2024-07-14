import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/fonts/strings_manger.dart';
import '../../../../core/utils/app_regex.dart';
import '../../bloc/forget_password_bloc.dart';

class EmailForgetPasswordTextFormField extends StatelessWidget {
  const EmailForgetPasswordTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) => context
              .read<ForgetPasswordBloc>()
              .add(UserForgetPasswordEmailAddressEvent(value)),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isEmailValid(value)) {
              return AppStrings.isEmailValid;
            }
            return null;
          },
          controller: context
              .read<ForgetPasswordBloc>()
              .userForgetPasswordEmailAddress,
          decoration: InputDecoration(
              prefixIcon: Icon(
                IconlyBroken.message,
                size: 18.sp,
              ),
              hintText: AppStrings.emailExample,
              errorText: state.whenOrNull(
                userForgetEmailAddress: (value) {
                  return value.isNotEmpty ? value : null;
                },
              )),
        );
      },
    );
  }
}
