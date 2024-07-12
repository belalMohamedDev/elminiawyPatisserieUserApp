
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/sharedWidget/circle_avatar_icon_button.dart';
import '../../../../core/style/images/asset_manger.dart';

class SignUpUsingGoogleAppleFaceBook extends StatelessWidget {
  const SignUpUsingGoogleAppleFaceBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatarIconButton(
          imagePath: ImageAsset.apple,
          function: () {},
        ),
        SizedBox(
          width: 10.w,
        ),
        CircleAvatarIconButton(
          imagePath: ImageAsset.google,
          function: () {},
        ),
        SizedBox(
          width: 10.w,
        ),
        CircleAvatarIconButton(
          imagePath: ImageAsset.faceBook,
          function: () {},
        )
      ],
    );
  }
}