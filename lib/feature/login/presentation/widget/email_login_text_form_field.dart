import 'package:elminiawy/core/style/fonts/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/login_bloc.dart';

class EmailLoginTextFormField extends StatelessWidget {
  const EmailLoginTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.email,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(
          height: 8.h,
        ),
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return TextFormField(
              onChanged: (value) =>
                  context.read<LoginBloc>().add(UserLoginEmailAddress(value)),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: context.read<LoginBloc>().userLoginEmailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    IconlyBroken.message,
                    size: 18.sp,
                  ),
                  hintText: AppStrings.emailExample,
                  errorText: state.whenOrNull(
                    userLoginEmailAddress: (value) {
                      return value.isNotEmpty ? value : null;
                    },
                  )),
            );
          },
        ),
      ],
    );
  }
}
