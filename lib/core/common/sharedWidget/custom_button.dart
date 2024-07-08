import 'package:elminiawy/core/style/color/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color color;
  final Widget? widget;

  CustomButton({
    super.key,
    color,
    required this.onPressed,
    required this.widget,
  }) : color = onPressed == null ? ColorManger.primary : ColorManger.darkBlue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r), color: color),
      child: TextButton(onPressed: onPressed, child: widget!),
    );
  }
}
