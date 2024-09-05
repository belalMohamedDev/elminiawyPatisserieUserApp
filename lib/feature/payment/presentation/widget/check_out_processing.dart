import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';

class CheckOutProcessing extends StatelessWidget {
  const CheckOutProcessing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManger.backgroundItem,
          borderRadius: BorderRadius.circular(5.r)),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ColorManger.brun,
            maxRadius: 12.r,
            child: Text(
              '1',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.white,
                  fontSize: 12.sp),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            'Shipping',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 13.sp),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorManger.brun,
                width: 2.w,
              ),
            ),
            child: CircleAvatar(
              backgroundColor: ColorManger.white,
              maxRadius: 10.r,
              child: Text(
                '2',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.brown,
                    fontSize: 12.sp),
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            'Payment',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 13.sp),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorManger.brun,
                width: 2.w,
              ),
            ),
            child: CircleAvatar(
              backgroundColor: ColorManger.white,
              maxRadius: 10.r,
              child: Text(
                '3',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.brun,
                    fontSize: 12.sp),
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            'Review',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}
