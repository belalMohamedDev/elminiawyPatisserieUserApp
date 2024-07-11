import 'package:elminiawy/core/style/fonts/strings_manger.dart';
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
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 15.sp),
            children: [
              WidgetSpan(
                  child: SizedBox(
                width: 8.w,
              )),
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // context.pushReplacementNamed(Routes.loginRoute);
                  },
                text: AppStrings.signIn,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 17.sp),
              )
            ]),
        style: Theme.of(context).textTheme.bodyLarge);
  }
}
