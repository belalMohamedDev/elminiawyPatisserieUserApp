import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
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
        color: ColorManger.brownLight,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Center(
          child: SizedBox(
            height: 40.h,
            child: TextFormField(
              controller: context.read<CartCubit>().applyCouponController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  prefixIcon: Transform.rotate(
                    angle: 1.58,
                    child: Icon(
                      IconlyBroken.ticket,
                      color: ColorManger.brunLight,
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () => context.read<CartCubit>().applyCoupon(),
                    child: Container(
                      width: 70.w,
                      decoration: BoxDecoration(
                        color: ColorManger.brun,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          'Apply',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: FontConsistent.fontFamilyAcme,
                                  color: ColorManger.white,
                                  fontSize: 12.sp),
                        ),
                      ),
                    ),
                  ),
                  hintText: 'Enter Voucher code',
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
      ),
    );
  }
}
