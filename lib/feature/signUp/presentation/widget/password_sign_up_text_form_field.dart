import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/fonts/strings_manger.dart';
import '../../bloc/sign_up_bloc.dart';

class PasswordSignUpTextFormField extends StatelessWidget {
  const PasswordSignUpTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.password,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              onChanged: (value) {
                context.read<SignUpBloc>().add(UserSignUpPasswordEvent(value));
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              controller: context.read<SignUpBloc>().userSignUpPassword,
              obscureText: context.read<SignUpBloc>().showPass,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  IconlyBroken.lock,
                  size: 18.sp,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    context
                        .read<SignUpBloc>()
                        .add(const UserShowSignUpPasswordEvent());
                  },
                  icon: context.read<SignUpBloc>().showPass
                      ? Icon(
                          IconlyBroken.show,
                          size: 25.sp,
                        )
                      : Icon(
                          IconlyBroken.hide,
                          size: 25.sp,
                        ),
                ),
                hintText: AppStrings.enterYourPassword,
                errorText: state.whenOrNull(
                  userSignUpPassword: (value) {
                    return value.isNotEmpty ? value : null;
                  },
                )
              ),
            )
          ],
        );
      },
    );
  }
}
