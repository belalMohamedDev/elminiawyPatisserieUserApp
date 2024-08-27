import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';

class CustomProfileCard extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final GestureTapCallback tap;

  const CustomProfileCard({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: ColorManger.backgroundItem),
        InkWell(
          onTap: tap,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              children: [
                Icon(
                  leadingIcon,
                  color: ColorManger.brun,
                  size: 16.sp,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.brun,
                        fontSize: 12.sp)),
                const Spacer(),
                Icon(
                  IconlyBroken.arrowRight2,
                  color: ColorManger.brun,
                  size: 18.sp,
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: ColorManger.backgroundItem,
        ),
      ],
    );
  }
}
