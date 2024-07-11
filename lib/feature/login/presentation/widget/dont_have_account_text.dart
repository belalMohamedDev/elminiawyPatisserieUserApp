import 'package:elminiawy/core/style/fonts/strings_manger.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DontHaveAnAccountText extends StatelessWidget {
  const DontHaveAnAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(
            text: AppStrings.dontHaveAnAccount,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 14.sp),
            children: [
              WidgetSpan(
                  child: SizedBox(
                width: 8.w,
              )),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // context
                      //   .pushReplacementNamed(Routes.registerRoute);
                    },
                  text: AppStrings.signUp,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: 15.sp,
                      ))
            ]),
        style: Theme.of(context).textTheme.bodyLarge);
  }
}
