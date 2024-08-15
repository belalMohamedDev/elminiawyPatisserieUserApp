import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/sharedWidget/layout_builder_point_line.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../cubit/cart_cubit.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartData = context.read<CartCubit>().cartData;

    return Container(
      height: 350.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, top: 15.h, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Summary',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.brown,
                  fontSize: 18.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Text(
                  'Sub Total',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brown,
                      fontSize: 14.sp),
                ),
                const Spacer(),
                Container(
                  height: 30.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: ColorManger.backgroundItem,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: Text(
                      '${cartData!.totalCartPrice} \$',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brown,
                          fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const LayoutBuilderPointLine(),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Text(
                  'Price After Discount',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brown,
                      fontSize: 14.sp),
                ),
                const Spacer(),
                Container(
                  height: 30.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: ColorManger.backgroundItem,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: Text(
                      '${cartData.totalPriceAfterDiscount} \$',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: Colors.green,
                          fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  'Tax',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brown,
                      fontSize: 14.sp),
                ),
                const Spacer(),
                Container(
                  height: 30.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: ColorManger.backgroundItem,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: Text(
                      '${cartData.taxPrice} \$',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brunLight,
                          fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  'Shipping',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brown,
                      fontSize: 14.sp),
                ),
                const Spacer(),
                Container(
                  height: 30.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: ColorManger.backgroundItem,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: Text(
                      '${cartData.shippingPrice} \$',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brunLight,
                          fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const LayoutBuilderPointLine(),
            SizedBox(
              height: 25.h,
            ),
            Row(
              children: [
                Text(
                  'Total Payment Amount',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brown,
                      fontSize: 16.sp),
                ),
                const Spacer(),
                Container(
                  height: 30.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: ColorManger.backgroundItem,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: Text(
                      '${cartData.totalOrderPrice} \$',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brun,
                          fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
