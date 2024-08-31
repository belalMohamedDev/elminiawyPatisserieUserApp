import 'package:elminiawy/feature/cart/data/model/response/get_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';

class PaymentSummary extends StatelessWidget {
  final GetCartDataResponse cartData;

  const PaymentSummary({
    super.key,
    required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    // final cartData = context.read<CartCubit>().cartData;

    return Container(
      height: 180.h,
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                Text(
                  'EGP  ${cartData.totalCartPrice} ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brown,
                      fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
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
                Text(
                  'EGP  ${cartData.totalPriceAfterDiscount}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: Colors.green,
                      fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
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
                Text(
                  'EGP  ${cartData.taxPrice}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brunLight,
                      fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
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
                Text(
                  'EGP  ${cartData.shippingPrice}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brunLight,
                      fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Text(
                  'Total Amount',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brown,
                      fontSize: 18.sp),
                ),
                const Spacer(),
                Text(
                  'EGP  ${cartData.totalOrderPrice}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 16.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
