import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/fonts/strings_manger.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(
            text: AppStrings.alreadyHaveAccount,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14.sp,
                ),
            children: [
              WidgetSpan(
                  child: SizedBox(
                width: 10.w,
              )),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.pushReplacementNamed(Routes.loginRoute);
                    },
                  text: AppStrings.signIn,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 18.sp,
                      fontFamily: FontConsistent.fontFamilyAcme))
            ]),
        style: Theme.of(context).textTheme.bodyLarge);
  }
}
