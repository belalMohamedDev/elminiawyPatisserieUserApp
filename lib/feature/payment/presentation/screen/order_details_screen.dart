import 'package:cached_network_image/cached_network_image.dart';
import 'package:elminiawy/core/common/sharedWidget/custom_button.dart';
import 'package:elminiawy/core/style/images/asset_manger.dart';
import 'package:elminiawy/core/utils/date_extension.dart';
import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../cubit/payment_cubit.dart';
import '../../data/model/response/create_order.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Order Details",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              cancelBottomSheet(context);
            },
            child: Text("Cancel",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.redError,
                    fontSize: 16.sp)),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: const OrderDetailsBody(),
    );
  }

  void cancelBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
        useRootNavigator: true,
        barrierColor: Colors.black54,
        elevation: 20.r,
        context: context,
        builder: (context) => SizedBox(
              height: 350.h,
              child: Padding(
                padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    Image.asset(
                      ImageAsset.basket,
                      height: 80.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                        'Are you sure you want to cancel\n your order? This can\'t be undone',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: FontConsistent.fontFamilyAcme,
                            color: ColorManger.brunLight,
                            fontSize: 16.sp)),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      onPressed: () {},
                      radius: 8.r,
                      widget: Text('Yes, Cancel',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: FontConsistent.fontFamilyAcme,
                                  color: ColorManger.white,
                                  fontSize: 14.sp)),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomButton(
                      onPressed: () {
                        context.pop();
                      },
                      radius: 8.r,
                      color: ColorManger.brownLight,
                      widget: Text('No, Keep it',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: FontConsistent.fontFamilyAcme,
                                  color: ColorManger.brun,
                                  fontSize: 14.sp)),
                    )
                  ],
                ),
              ),
            ));
  }
}

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final createOrderResponse =
        context.read<PaymentCubit>().createOrderResponseData;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                _orderIdContainer(context),
                SizedBox(
                  height: 10.h,
                ),
                _orderStautsStepper(context, createOrderResponse),
                SizedBox(
                  height: 10.h,
                ),
                _orderShippingInformation(context, createOrderResponse),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          _productItemSliverList(createOrderResponse),
        ],
      ),
    );
  }

  SliverList _productItemSliverList(
      CreateOrderResponseData? createOrderResponse) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: createOrderResponse!.cartItems!.length,
            (context, index) {
      return Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: Slidable(
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
                      imageUrl: createOrderResponse
                              .cartItems![index].product?.image ??
                          '',
                      height: 60.h,
                      placeholder: (context, url) => Image.asset(
                        ImageAsset.picture,
                        height: 60.h,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  _namePriceAndRatingColumn(
                      context, createOrderResponse.cartItems![index]),
                  const Spacer(),
                ],
              ),
            ),
          ));
    }));
  }

  Container _orderShippingInformation(
      BuildContext context, CreateOrderResponseData? createOrderResponse) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManger.backgroundItem,
          borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding:
            EdgeInsets.only(left: 12.w, right: 18.w, top: 12.h, bottom: 15.h),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                Icon(
                  Icons.attach_money_sharp,
                  color: ColorManger.brun,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text("${createOrderResponse!.totalOrderPrice}  EGP",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.brun,
                        fontSize: 12.sp)),
                SizedBox(
                  width: 30.w,
                ),
                const Spacer(),
                Container(
                  height: 40.h,
                  width: 1.w,
                  decoration: BoxDecoration(color: ColorManger.brownLight),
                ),
                const Spacer(),
                Icon(
                  Icons.credit_card,
                  color: ColorManger.brun,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text("${createOrderResponse.paymentMethodType}",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.brun,
                        fontSize: 12.sp)),
                const Spacer(),
              ],
            ),
            Divider(
              color: ColorManger.brownLight,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  IconlyBold.location,
                  color: ColorManger.brun,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Text(
                      "${createOrderResponse.shippingAddress!.phone},   ${createOrderResponse.shippingAddress!.region}",
                      softWrap: true,
                      maxLines: null,
                      overflow: TextOverflow.visible,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brun,
                          fontSize: 12.sp)),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Divider(
              color: ColorManger.brownLight,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("shipping Price",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.brun,
                        fontSize: 12.sp)),
                const Spacer(),
                Text("${createOrderResponse.shippingPrice}  EGP",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.brunLight,
                        fontSize: 12.sp)),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("tax Price",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.brun,
                        fontSize: 12.sp)),
                const Spacer(),
                Text("${createOrderResponse.taxPrice}  EGP",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.brunLight,
                        fontSize: 12.sp)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildLine(
    bool isCompleted,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: Column(
          children: List.generate(
        2,
        (index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Container(
            width: isCompleted ? 1.6.w : 1.8.w,
            height: 8.h,
            decoration: BoxDecoration(
                color: isCompleted ? ColorManger.brun : ColorManger.brownLight,
                borderRadius: BorderRadius.circular(8.r)),
          ),
        ),
      )),
    );
  }

  Column _buildStep(
      {required BuildContext context,
      required bool isCompleted,
      bool isCancelled = false,
      required String title,
      required String subTitle,
      String imagePath = ImageAsset.orderDelivered}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: isCompleted ? 0 : 6.w,
            ),
            CircleAvatar(
                radius: isCompleted
                    ? isCancelled
                        ? 15.r
                        : 11.r
                    : 5.r,
                backgroundColor: isCancelled
                    ? ColorManger.backgroundItem
                    : ColorManger.brownLight,
                child: isCompleted
                    ? Image.asset(
                        imagePath,
                      )
                    : null),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: isCompleted
                              ? ColorManger.brun
                              : ColorManger.brunLight,
                          fontSize: 10.sp)),
                  SizedBox(
                    height: isCompleted ? 5.h : 0,
                  ),
                  isCompleted
                      ? Text(subTitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: FontConsistent.fontFamilyAcme,
                                  color: ColorManger.brunLight,
                                  fontSize: 10.sp))
                      : const SizedBox(),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Column _namePriceAndRatingColumn(
      BuildContext context, CartOrderItems cartOrderItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cartOrderItems.product!.title!,
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
              initialRating: cartOrderItems.product!.ratingsAverage ?? 0,
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
          'Total Price:     ${cartOrderItems.totalItemPrice!}.00  \$',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: FontConsistent.fontFamilyAcme,
              color: ColorManger.brun,
              fontSize: 11.sp),
        ),
      ],
    );
  }

  Container _orderStautsStepper(
      BuildContext context, CreateOrderResponseData? createOrderResponse) {
    int orderStatus = createOrderResponse!.status!;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManger.backgroundItem,
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding:
            EdgeInsets.only(top: 15.h, right: 20.w, left: 20.w, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order Status",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.brun,
                    fontSize: 18.sp)),
            SizedBox(
              height: 15.h,
            ),
            orderStatus != 4
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStep(
                          context: context,
                          isCompleted: orderStatus >= 0,
                          title: "Order Placed",
                          subTitle:
                              'order has been placed at ${createOrderResponse.createdAt!.getFormattedDate()} .'),
                      _buildLine(orderStatus > 0),
                      _buildStep(
                          context: context,
                          isCompleted: orderStatus >= 1,
                          title: "Preparing",
                          subTitle: 'Your order is being prepared.'),
                      _buildLine(orderStatus > 1),
                      _buildStep(
                          context: context,
                          isCompleted: orderStatus >= 2,
                          title: "On its way",
                          subTitle: 'Your order is on its way.'),
                      _buildLine(orderStatus > 2),
                      _buildStep(
                        context: context,
                        isCompleted: orderStatus >= 3,
                        title: "Delivered",
                        subTitle: 'Your order was delivered successfully.',
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStep(
                          context: context,
                          isCompleted: orderStatus == 4,
                          title: "Order Placed",
                          subTitle:
                              'order has been placed at ${createOrderResponse.createdAt!.getFormattedDate()}'),
                      _buildLine(orderStatus == 4),
                      _buildStep(
                          isCancelled: true,
                          context: context,
                          isCompleted: orderStatus == 4,
                          title: "Cancelled",
                          subTitle: 'Your order was cancelled.',
                          imagePath: ImageAsset.orderCancel),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  Container _orderIdContainer(BuildContext context) {
    int orderStatus =
        context.read<PaymentCubit>().createOrderResponseData!.status!;
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
          color: ColorManger.brownLight,
          borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          SizedBox(
            width: 20.w,
          ),
          Image.asset(
            orderStatus == 4
                ? ImageAsset.orderCancel
                : orderStatus == 3
                    ? ImageAsset.orderDelivered
                    : ImageAsset.shoppingBag,
            height: orderStatus == 3 ? 30.h : 35.h,
          ),
          SizedBox(
            width: 15.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Order ID",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 13.sp)),
              SizedBox(
                height: 5.h,
              ),
              Text(
                  "# ${context.read<PaymentCubit>().createOrderResponseData!.sId ?? ''}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brunLight,
                      fontSize: 12.sp)),
            ],
          ),
        ],
      ),
    );
  }
}
