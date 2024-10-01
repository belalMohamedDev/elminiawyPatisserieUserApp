import 'package:elminiawy/core/routing/routes.dart';
import 'package:elminiawy/core/style/color/color_manger.dart';
import 'package:elminiawy/core/style/fonts/strings_manger.dart';
import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/app_storage_key.dart';
import '../../../../core/services/shared_pref_helper.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          context.pushNamedAndRemoveUntil(Routes.map);

          SharedPrefHelper.setData(PrefKeys.prefsKeyOnBoardingScreenView, true);
          SharedPrefHelper.setData(PrefKeys.prefsKeyAnonymousUser, true);
          SharedPrefHelper.setData(PrefKeys.prefsSetLoginMap, true);

       
        },
        child: Text(AppStrings.letsGetStarted,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ColorManger.white, fontSize: 14.sp)),
      ),
    );
  }
}
