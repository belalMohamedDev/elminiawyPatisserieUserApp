import 'package:elminiawy/core/style/color/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color color;
  final Widget? widget;
  final double? height;
  final double? width;

  CustomButton(
      {super.key,
      color,
      required this.onPressed,
      required this.widget,
      height,
      this.width = double.infinity})
      : color =
            onPressed == null ? ColorManger.unselectedButton : ColorManger.brun,
        height = 40.h;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r), color: color),
      child: TextButton(onPressed: onPressed, child: widget!),
    );
  }
}
