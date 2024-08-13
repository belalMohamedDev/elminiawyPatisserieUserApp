import 'package:cached_network_image/cached_network_image.dart';
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
import '../../data/model/response/get_cart.dart';

class ProductCartItem extends StatelessWidget {
  final GetCartItems cartItems;
  const ProductCartItem({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                context.read<CartCubit>().removeItem(cartItems.sId!);
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
                  imageUrl: cartItems.product?.image ?? '',
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
                              .updateQuantityToItem(cartItems.sId!, -1),
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
                          '${cartItems.quantity!}',
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
                              .updateQuantityToItem(cartItems.sId!, 1),
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
          'Total Price:     ${cartItems.totalItemPrice!}.00  \$',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: FontConsistent.fontFamilyAcme,
              color: ColorManger.brun,
              fontSize: 13.sp),
        ),
      ],
    );
  }

}
