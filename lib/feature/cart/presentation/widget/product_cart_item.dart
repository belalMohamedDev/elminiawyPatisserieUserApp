import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/images/asset_manger.dart';
import '../../cubit/cart_cubit.dart';
import '../../data/model/response/get_cart.dart';

class ProductCartItem extends StatelessWidget {
  final GetCartItems cartItems;
  const ProductCartItem({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              context.read<CartCubit>().removeItem(cartItems.sId!);
            },
            backgroundColor: ColorManger.redError,
            foregroundColor: ColorManger.backgroundItem,
            icon: IconlyBold.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        height: 80.h,
        decoration: BoxDecoration(
          color: ColorManger.backgroundItem,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorManger.brownLight,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: CachedNetworkImage(
                imageUrl: cartItems.product?.image ?? '',
                height: 60.h,
                placeholder: (context, url) => Image.asset(
                  ImageAsset.picture,
                  height: 60.h,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            _namePriceAndRatingColumn(context, cartItems),
            const Spacer(),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Column(
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
                                .updateQuantityToItem(cartItems.sId!, -1),
                            child: CircleAvatar(
                              backgroundColor: ColorManger.brownLight,
                              maxRadius: 12.r,
                              child: state is UpdateQuantityItemLoading
                                  ? (state).quantity == -1 &&
                                          (state).id == cartItems.sId
                                      ? CircularProgressIndicator(
                                          color: ColorManger.brown,
                                        )
                                      : Icon(
                                          Icons.remove,
                                          color: ColorManger.brown,
                                          size: 15.r,
                                        )
                                  : Icon(
                                      Icons.remove,
                                      color: ColorManger.brown,
                                      size: 15.r,
                                    ),
                            ),
                          ),
                          SizedBox(
                            width: 5.h,
                          ),
                          Text(
                            '${cartItems.quantity!}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontFamily: FontConsistent.fontFamilyAcme,
                                    color: ColorManger.brown,
                                    fontSize: 11.sp),
                          ),
                          SizedBox(
                            width: 5.h,
                          ),
                          GestureDetector(
                            onTap: () => context
                                .read<CartCubit>()
                                .updateQuantityToItem(cartItems.sId!, 1),
                            child: CircleAvatar(
                              maxRadius: 12.r,
                              backgroundColor: ColorManger.brun,
                              child: state is UpdateQuantityItemLoading
                                  ? (state).quantity == 1 &&
                                          (state).id == cartItems.sId
                                      ? CircularProgressIndicator(
                                          color: ColorManger.white,
                                        )
                                      : Icon(
                                          Icons.add_rounded,
                                          color: ColorManger.white,
                                          size: 15.r,
                                        )
                                  : Icon(
                                      Icons.add_rounded,
                                      color: ColorManger.white,
                                      size: 15.r,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
      ),
    );
  }

  Column _namePriceAndRatingColumn(
      BuildContext context, GetCartItems cartItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cartItems.product!.title!,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: FontConsistent.fontFamilyAcme,
              color: ColorManger.brun,
              fontSize: 12.sp),
        ),
        SizedBox(
          height: 5.h,
        ),
        IgnorePointer(
          ignoring: true,
          child: RatingBar(
              initialRating: cartItems.product!.ratingsAverage!,
              direction: Axis.horizontal,
              itemSize: 11.sp,
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
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          'Total Price:     ${cartItems.totalItemPrice!}.00  \$',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: FontConsistent.fontFamilyAcme,
              color: ColorManger.brun,
              fontSize: 11.sp),
        ),
      ],
    );
  }
}
