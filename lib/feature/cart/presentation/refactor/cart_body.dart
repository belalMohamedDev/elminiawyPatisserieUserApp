import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/cart_cubit.dart';
import '../widget/apply_coupon.dart';
import '../widget/payment_summary.dart';
import '../widget/product_cart_item.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetCartItemSuccess) {
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(
                    top: 5.h, left: 8.w, right: 8.w, bottom: 10.h),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: ProductCartItem(
                            cartItems: state.data.data!.cartItems![index]),
                      );
                    },
                    childCount: state.data.data?.cartItems?.length ?? 0,
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
                      PaymentSummary(state)
                    ],
                  ),
                ),
              ),
            ], // Other slivrs for remaining widgets
          );
        }
        return const SizedBox();
      },
    );
  }
}
