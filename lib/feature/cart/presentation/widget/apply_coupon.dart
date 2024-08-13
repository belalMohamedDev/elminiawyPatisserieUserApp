import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../cubit/cart_cubit.dart';

class ApplyCouponCode extends StatelessWidget {
  const ApplyCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: ColorManger.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40.h,
                child: TextFormField(
                  controller: context.read<CartCubit>().applyCouponController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Enter Coupon code',
                      hintStyle: TextStyle(color: ColorManger.brunLight),
                      fillColor: ColorManger.backgroundItem,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManger.backgroundItem,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManger.backgroundItem,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                      )),
                ),
              ),
            ),
            InkWell(
              onTap: () => context.read<CartCubit>().applyCoupon(),
              child: Container(
                height: 38.h,
                width: 70.w,
                margin: EdgeInsets.only(left: 10.w, right: 5.w),
                decoration: BoxDecoration(
                  color: ColorManger.brun,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    'Apply',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.white,
                        fontSize: 12.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
