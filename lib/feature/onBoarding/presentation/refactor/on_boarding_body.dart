import 'package:elminiawy/core/style/images/asset_manger.dart';
import 'package:elminiawy/feature/onBoarding/presentation/widget/get_started_button.dart';
import 'package:elminiawy/feature/onBoarding/presentation/widget/title_and_head_line_text.dart';
import 'package:elminiawy/feature/onBoarding/presentation/widget/sign_in_text_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 20.h),
      child: Column(
        children: [
          Image.asset(
            ImageAsset.onBoarding,
            height: 400.h,
          ),
          SizedBox(
            height: 40.h,
          ),
          const TitleAndHeadLineText(),
          SizedBox(
            height: 35.h,
          ),
          const GetStartedButton(),
          SizedBox(
            height: 25.h,
          ),
          const AlreadyAccountTextSpan()
        ],
      ),
    );
  }
}

