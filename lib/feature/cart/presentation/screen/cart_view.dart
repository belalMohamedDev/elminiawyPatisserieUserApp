import 'package:cached_network_image/cached_network_image.dart';
import 'package:elminiawy/feature/cart/data/model/response/get_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/common/loading/loading_shimmer.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../cubit/cart_cubit.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        context.read<CartCubit>().getCartItem(),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.backgroundItem,
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Cart",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
      ),
      body: const CartBody(),
      bottomSheet: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is GetCartItemSuccess) {
            return Padding(
              padding: EdgeInsets.only(
                left: 8.w,
                right: 8.w,
              ),
              child: Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorManger.white,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 25.h, right: 10.w, left: 10.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Grand Total',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontFamily: FontConsistent.fontFamilyAcme,
                                    color: ColorManger.brun,
                                    fontSize: 18.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            height: 30.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              color: ColorManger.backgroundItem,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Center(
                              child: Text(
                                '${state.data.data?.totalOrderPrice} \$',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
                                        color: ColorManger.brown,
                                        fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Container(
                          height: 38.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: ColorManger.brun,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Center(
                            child: Text(
                              'Proceed to payment',
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
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetCartItemSuccess) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 5.h, left: 8.w, right: 8.w, bottom: 220.h),
              child: Column(
                children: [
                  _productImageRatingNameAndFavoritRow(
                      context, state.data.data?.cartItems),
                  SizedBox(
                    height: 5.h,
                  ),
                  _productImageRatingNameAndFavoritRow(
                      context, state.data.data?.cartItems),
                  SizedBox(
                    height: 5.h,
                  ),
                  _productImageRatingNameAndFavoritRow(
                      context, state.data.data?.cartItems),
                  SizedBox(
                    height: 10.h,
                  ),
                  _applyCouponCode(context),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 350.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorManger.white,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 15.w, top: 15.h, right: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Summary',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
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
                                    '${state.data.data?.totalCartPrice} \$',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontFamily:
                                                FontConsistent.fontFamilyAcme,
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
                          LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            final boxWidth = constraints.constrainWidth();
                            final dashWidth = 10.w;
                            final dashCount =
                                (boxWidth / (2 * dashWidth)).floor();
                            return Flex(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              direction: Axis.horizontal,
                              children: List.generate(dashCount, (_) {
                                return SizedBox(
                                  width: dashWidth,
                                  height: 1.h,
                                  child: DecoratedBox(
                                    decoration:
                                        BoxDecoration(color: ColorManger.brown),
                                  ),
                                );
                              }),
                            );
                          }),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Text(
                                'Price After Discount',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
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
                                    '${state.data.data?.totalPriceAfterDiscount} \$',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontFamily:
                                                FontConsistent.fontFamilyAcme,
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
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
                                    '${state.data.data?.taxPrice} \$',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontFamily:
                                                FontConsistent.fontFamilyAcme,
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
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
                                    '${state.data.data?.shippingPrice} \$',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontFamily:
                                                FontConsistent.fontFamilyAcme,
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
                          LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {
                            final boxWidth = constraints.constrainWidth();
                            final dashWidth = 10.w;
                            final dashCount =
                                (boxWidth / (2 * dashWidth)).floor();
                            return Flex(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              direction: Axis.horizontal,
                              children: List.generate(dashCount, (_) {
                                return SizedBox(
                                  width: dashWidth,
                                  height: 1.h,
                                  child: DecoratedBox(
                                    decoration:
                                        BoxDecoration(color: ColorManger.brown),
                                  ),
                                );
                              }),
                            );
                          }),
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            children: [
                              Text(
                                'Total Payment Amount',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
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
                                    '${state.data.data?.totalOrderPrice} \$',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontFamily:
                                                FontConsistent.fontFamilyAcme,
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
                  )
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Container _applyCouponCode(BuildContext context) {
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
                  //      controller: getProduct.search,
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
            Container(
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
          ],
        ),
      ),
    );
  }

  SizedBox _productImageRatingNameAndFavoritRow(
      BuildContext context, List<GetCartItems>? cartItems) {
    return SizedBox(
      height: 100.h,
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                context.read<CartCubit>().removeItem(cartItems!.first.sId!);
              },
              backgroundColor: ColorManger.redError,
              foregroundColor: ColorManger.white,
              icon: IconlyBold.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          height: 100.h,
          decoration: BoxDecoration(
            color: ColorManger.white,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorManger.backgroundItem,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: CachedNetworkImage(
                  imageUrl: cartItems?.first.product?.image ?? '',
                  height: 70.h,
                  placeholder: (context, url) => const LoadingShimmer(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              _namePriceAndRatingColumn(context, cartItems),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManger.brownLight,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => context
                              .read<CartCubit>()
                              .updateQuantityToItem(cartItems!.first.sId!, -1),
                          child: CircleAvatar(
                            backgroundColor: ColorManger.brownLight,
                            maxRadius: 15.r,
                            child: Icon(
                              Icons.remove,
                              color: ColorManger.brown,
                              size: 15.r,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Text(
                          '${cartItems!.first.quantity!}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: FontConsistent.fontFamilyAcme,
                                  color: ColorManger.brown,
                                  fontSize: 15.sp),
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        GestureDetector(
                          onTap: () => context
                              .read<CartCubit>()
                              .updateQuantityToItem(cartItems.first.sId!, 1),
                          child: CircleAvatar(
                            maxRadius: 15.r,
                            backgroundColor: ColorManger.brun,
                            child: Icon(
                              size: 15.r,
                              Icons.add_rounded,
                              color: ColorManger.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20.w,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _namePriceAndRatingColumn(
      BuildContext context, List<GetCartItems>? cartItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cartItems!.first.product!.title!,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: FontConsistent.fontFamilyAcme,
              color: ColorManger.brun,
              fontSize: 14.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        RatingBar(
            initialRating: 3,
            direction: Axis.horizontal,
            itemSize: 13.sp,
            itemCount: 5,
            allowHalfRating: true,
            itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
            onRatingUpdate: (rating) {},
            ratingWidget: RatingWidget(
                full: Icon(
                  IconlyBold.star,
                  color: ColorManger.brown,
                ),
                half: Icon(
                  IconlyBold.star,
                  color: ColorManger.brun,
                ),
                empty: Icon(
                  IconlyBroken.star,
                  color: ColorManger.brunLight,
                ))),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Total Price:     ${cartItems.first.totalItemPrice!}.00  \$',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: FontConsistent.fontFamilyAcme,
              color: ColorManger.brun,
              fontSize: 13.sp),
        ),
      ],
    );
  }
}
