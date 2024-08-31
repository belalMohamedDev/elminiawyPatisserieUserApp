import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/response/get_cart.dart';
import '../widget/apply_coupon.dart';
import '../widget/payment_summary.dart';
import '../widget/product_cart_item.dart';

class SuccessCartScreen extends StatelessWidget {
  const SuccessCartScreen({
    super.key,
    required this.cartData,
  });

  final CartResponse? cartData;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding:
              EdgeInsets.only(top: 5.h, left: 8.w, right: 8.w, bottom: 10.h),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: ProductCartItem(
                      cartItems: cartData!.data!.cartItems![index]),
                );
              },
              childCount: cartData!.data!.cartItems?.length ?? 0,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 220.h),
            child: Column(
              children: [
                const ApplyCouponCode(),
                SizedBox(
                  height: 10.h,
                ),
                const PaymentSummary()
              ],
            ),
          ),
        ),
      ], // Other slivrs for remaining widgets
    );
  }
}
