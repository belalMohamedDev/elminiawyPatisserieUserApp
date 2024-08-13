import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/loading/loading_shimmer.dart';
import '../../../../core/style/color/color_manger.dart';
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
          if (state.data.data!.cartItems!.isEmpty) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: ColorManger.white,
            );
          }
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
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: 5.h, left: 10.w, right: 10.w, bottom: 10.h),
            child: Column(
              children: [
                _cardItemLoading(),
                SizedBox(
                  height: 10.h,
                ),
                _cardItemLoading(),
                SizedBox(
                  height: 10.h,
                ),
                _cardItemLoading(),
                SizedBox(
                  height: 10.h,
                ),
                _paymentCartLoading()
              ],
            ),
          ),
        );
      },
    );
  }

  Container _paymentCartLoading() {
    return Container(
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 60.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoadingShimmer(
              height: 4.h,
              width: 200.w,
              borderRadius: 12.r,
            ),
            SizedBox(
              height: 10.h,
            ),
            LoadingShimmer(
              height: 4.h,
              width: 150.w,
              borderRadius: 12.r,
            ),
            SizedBox(
              height: 30.h,
            ),
            // const LayoutBuilderPointLine(),
            SizedBox(
              height: 20.h,
            ),
            LoadingShimmer(
              height: 10.h,
              width: 300.w,
              borderRadius: 5.r,
            ),
            SizedBox(
              height: 20.h,
            ),
            LoadingShimmer(
              height: 10.h,
              width: 300.w,
              borderRadius: 5.r,
            ),
            SizedBox(
              height: 20.h,
            ),
            //const LayoutBuilderPointLine(),
            SizedBox(
              height: 20.h,
            ),
            LoadingShimmer(
              height: 4.h,
              width: 220.w,
              borderRadius: 12.r,
            ),
            SizedBox(
              height: 20.h,
            ),
            LoadingShimmer(
              height: 4.h,
              width: 180.w,
              borderRadius: 12.r,
            ),
          ],
        ),
      ),
    );
  }

  Container _cardItemLoading() {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10.w,
          ),
          LoadingShimmer(
            height: 60.h,
            width: 80.w,
            borderRadius: 12.r,
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoadingShimmer(
                height: 4.h,
                width: 180.w,
                borderRadius: 12.r,
              ),
              SizedBox(
                height: 10.h,
              ),
              LoadingShimmer(
                height: 4.h,
                width: 100.w,
                borderRadius: 12.r,
              ),
              SizedBox(
                height: 10.h,
              ),
              LoadingShimmer(
                height: 4.h,
                width: 180.w,
                borderRadius: 12.r,
              ),
            ],
          )
        ],
      ),
    );
  }
}
