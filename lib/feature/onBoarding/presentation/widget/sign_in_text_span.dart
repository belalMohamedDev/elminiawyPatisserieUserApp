import 'package:elminiawy/core/routing/routes.dart';
import 'package:elminiawy/core/style/fonts/font_manger.dart';
import 'package:elminiawy/core/style/fonts/strings_manger.dart';
import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlreadyAccountTextSpan extends StatelessWidget {
  const AlreadyAccountTextSpan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(
            text: AppStrings.alreadyHaveAnAccount,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 15.sp, fontFamily: FontConsistent.fontFamilyAcme),
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
                    fontSize: 18.sp, fontFamily: FontConsistent.fontFamilyAcme),
              )
            ]),
        style: Theme.of(context).textTheme.bodyLarge);
  }
}
