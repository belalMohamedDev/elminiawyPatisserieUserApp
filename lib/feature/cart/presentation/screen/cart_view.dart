import 'package:elminiawy/core/common/sharedWidget/custom_button.dart';
import 'package:elminiawy/feature/cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../refactor/cart_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _cartViewAppBar(context),
      body: const CartBody(),
      bottomNavigationBar: _cartViewBottomNavigationBar(),
    );
  }

  BlocBuilder<CartCubit, CartState> _cartViewBottomNavigationBar() {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetCartItemError ||
            state is GetCartItemLoading ||
            context.read<CartCubit>().cartData == null ||
            context.read<CartCubit>().cartData!.data!.cartItems!.isEmpty) {
          return const SizedBox();
        }
        return Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
          child: SizedBox(
            height: 50.h,
            child: Expanded(
              child: CustomButton(
                height: 45.h,
                radius: 14.r,
                onPressed: () {},
                widget: Text(
                  'CheckOut',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16.sp,
                      color: ColorManger.white,
                      fontWeight: FontWeightManger.semiBold),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar _cartViewAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text("My Cart",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: FontConsistent.fontFamilyAcme,
              color: ColorManger.brun,
              fontSize: 16.sp)),
      actions: [
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is GetCartItemError ||
                state is GetCartItemLoading ||
                context.read<CartCubit>().cartData == null ||
                context.read<CartCubit>().cartData!.data!.cartItems!.isEmpty) {
              return const SizedBox();
            }
            return InkWell(
              onTap: () {
                context.read<CartCubit>().removeCartLogic();
              },
              child: Icon(
                IconlyBold.delete,
                color: ColorManger.brunLight,
              ),
            );
          },
        ),
        SizedBox(
          width: 35.w,
        )
      ],
    );
  }
}
