import 'package:elminiawy/core/style/color/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final Widget? widget;
  final double? height;
  final double? width;
  final double? radius;

  const CustomButton(
      {super.key,
      this.color,
      required this.onPressed,
      required this.widget,
      this.height = 40,
      this.width = double.infinity,
      this.radius = 12});

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ??
        (onPressed == null ? ColorManger.unselectedButton : ColorManger.brun);
    return Container(
      height: height!.h,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!.r), color: buttonColor),
      child: TextButton(onPressed: onPressed, child: widget!),
    );
  }
}
