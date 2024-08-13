import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/color/color_manger.dart';

class LayoutBuilderPointLine extends StatelessWidget {
  const LayoutBuilderPointLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final boxWidth = constraints.constrainWidth();
      final dashWidth = 10.w;
      final dashCount = (boxWidth / (2 * dashWidth)).floor();
      return Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: List.generate(dashCount, (_) {
          return SizedBox(
            width: dashWidth,
            height: 1.h,
            child: DecoratedBox(
              decoration: BoxDecoration(color: ColorManger.brown),
            ),
          );
        }),
      );
    });
  }
}
