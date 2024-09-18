import 'package:cached_network_image/cached_network_image.dart';
import 'package:elminiawy/core/style/images/asset_manger.dart';
import 'package:elminiawy/core/utils/date_extension.dart';
import 'package:elminiawy/core/utils/extensions.dart';
import 'package:elminiawy/feature/order/data/model/response/get_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/common/toast/show_toast.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../cubit/payment_cubit.dart';
import '../../data/model/response/create_order.dart';

class OrderDetailsBody extends StatelessWidget {
  final GetOrdersResponseData? order;
  const OrderDetailsBody({super.key, this.order});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        state.whenOrNull(
          createCashOrderLoading: () => context.pop(),
          createCashOrderError: (statesCode, errorMessage) =>
              ShowToast.showToastErrorTop(
                  errorMessage: errorMessage, context: context),
          createCashOrderSuccess: (createOrderResponse) {
            if (order != null) {
              ShowToast.showToastSuccessTop(
                  message: 'success to cancel order', context: context);
              context.pop();
              context.pop();
            }
          },
        );
      },
      builder: (context, state) {
        final createOrderResponse =
            context.read<PaymentCubit>().createOrderResponseData;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        _orderIdContainer(context, createOrderResponse, order),
                        SizedBox(
                          height: 10.h,
                        ),
                        _orderStautsStepper(
                            context, createOrderResponse, order),
                        SizedBox(
                          height: 10.h,
                        ),
                        _orderShippingInformation(
                            context, createOrderResponse, order),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                  _productItemSliverList(createOrderResponse, order),
                ],
              ),
              if (state is CreateCashOrderLoading)
                Center(
                  child: Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                          color: ColorManger.brun,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.r),
                          child: CircularProgressIndicator(
                            color: ColorManger.white,
                            strokeWidth: 3.sp,
                          ),
                        ),
                      )),
                ),
            ],
          ),
        );
      },
    );
  }

  SliverList _productItemSliverList(
      CreateOrderResponseData? createOrderResponse,
      GetOrdersResponseData? order) {
    final cartItems = order?.cartItems ?? createOrderResponse?.cartItems;

    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: cartItems!.length,
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
                      imageUrl: order?.cartItems?[index].product?.image ??
                          createOrderResponse
                              ?.cartItems?[index].product?.image ??
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
                      order, index, createOrderResponse, context),
                  const Spacer(),
                ],
              ),
            ),
          ));
    }));
  }

  Column _namePriceAndRatingColumn(GetOrdersResponseData? order, int index,
      CreateOrderResponseData? createOrderResponse, BuildContext context) {
    dynamic response = order ?? createOrderResponse;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          response!.cartItems![index].product!.title,
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
              initialRating: response.cartItems![index].product!.ratingsAverage,
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
          'Total Price:     ${response.cartItems![index].totalItemPrice}.00  \$',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: FontConsistent.fontFamilyAcme,
              color: ColorManger.brun,
              fontSize: 11.sp),
        ),
      ],
    );
  }

  Container _orderShippingInformation(
      BuildContext context,
      CreateOrderResponseData? createOrderResponse,
      GetOrdersResponseData? order) {
    dynamic response = order ?? createOrderResponse;

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
                Text("${response!.totalOrderPrice}  EGP",
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
                Text("${response.paymentMethodType}",
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
                      "${response!.shippingAddress!.phone},   ${response.shippingAddress!.region}",
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
                Text("${response.shippingPrice}  EGP",
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
                Text("${response.taxPrice}  EGP",
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

  Container _orderStautsStepper(
      BuildContext context,
      CreateOrderResponseData? createOrderResponse,
      GetOrdersResponseData? order) {
    dynamic response = order ?? createOrderResponse;

    int orderStatus = response!.status;
    String createAt = response.createdAt;

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
                              'order has been placed at ${createAt.getFormattedDate()} .'),
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
                              'order has been placed at ${createAt.getFormattedDate()}'),
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

  Container _orderIdContainer(
      BuildContext context,
      CreateOrderResponseData? createOrderResponse,
      GetOrdersResponseData? order) {
    dynamic response = order ?? createOrderResponse;

    int orderStatus = response!.status!;
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
              Text("# ${response!.sId ?? ''}",
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
