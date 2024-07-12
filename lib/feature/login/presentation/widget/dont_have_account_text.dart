import 'package:elminiawy/core/style/fonts/strings_manger.dart';
import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/style/fonts/font_manger.dart';

class DontHaveAnAccountText extends StatelessWidget {
  const DontHaveAnAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(
            text: AppStrings.dontHaveAnAccount,
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
                      context.pushReplacementNamed(Routes.registerRoute);
                    },
                  text: AppStrings.signUp,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 18.sp,
                      fontFamily: FontConsistent.fontFamilyAcme))
            ]),
        style: Theme.of(context).textTheme.bodyLarge);
  }
}
