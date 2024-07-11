import 'package:elminiawy/core/style/fonts/font_manger.dart';
import 'package:elminiawy/core/style/fonts/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAndHeadLineText extends StatelessWidget {
  const TitleAndHeadLineText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.welcomeToElminiawyPatisserie,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontFamily: FontConsistent.fontFamilyAcme),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          AppStrings.tasteHappiness,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
              ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          AppStrings.discoverOurWonderfulSelection,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontFamily: FontConsistent.fontFamilyAcme),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
