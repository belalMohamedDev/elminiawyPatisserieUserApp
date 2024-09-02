import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coupon_uikit/coupon_uikit.dart';

import '../../../../core/common/sharedWidget/layout_builder_point_line.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import 'package:elminiawy/feature/cart/data/model/response/get_cart.dart';

class PaymentSummary extends StatelessWidget {
  final GetCartDataResponse cartData;

  const PaymentSummary({
    super.key,
    required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    return CouponCard(
      backgroundColor: ColorManger.backgroundItem,
      curveAxis: Axis.vertical,
      curvePosition: 150.w,
      clockwise: true,
      borderRadius: 18.r,
      curveRadius: 40.r,
      height: 190.h,
      firstChild: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sub Total',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brown,
                      fontSize: 14.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Price After Discount',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brown,
                      fontSize: 14.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Tax',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brown,
                      fontSize: 14.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Shipping',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brown,
                      fontSize: 14.sp),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Total Amount',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brown,
                      fontSize: 18.sp),
                ),
              ],
            ),
          ),
          const LayoutBuilderPointLine(),
        ],
      ),
      secondChild: Padding(
        padding: EdgeInsets.only(
            left: 10.w, right: 20.w, top: 20.w), // Adjusted padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'EGP ${cartData.totalCartPrice}',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.brown,
                  fontSize: 14.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              'EGP ${cartData.totalPriceAfterDiscount}',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.brown,
                  fontSize: 14.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              'EGP ${cartData.taxPrice}',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.brown,
                  fontSize: 14.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              'EGP ${cartData.shippingPrice}',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.brown,
                  fontSize: 14.sp),
            ),
            SizedBox(height: 15.h),
            Text(
              'EGP ${cartData.totalOrderPrice}',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.brown,
                  fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}
