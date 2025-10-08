import 'package:elminiawy/core/common/shared/shared_imports.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
    required this.orderModel,
  });

  final GetOrdersResponseData orderModel;

  @override
  Widget build(BuildContext context) {
    bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;

    final responsive = ResponsiveUtils(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.translate(AppStrings.orderDetails),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: responsive.setTextSize(4))),
        leading: IconButton(
          icon: Icon(
              isEnLocale ? IconlyBroken.arrowLeft : IconlyBroken.arrowRight),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: responsive.setPadding(right: 4, left: 4, top: 1),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _orderIdContainer(context, orderModel, responsive),
            ),
            SliverToBoxAdapter(
              child: responsive.setSizeBox(height: 1),
            ),
            _productItemSliverList(orderModel, responsive),
            SliverToBoxAdapter(
              child: orderModel.notes != ""
                  ? _noteContainer(responsive, context)
                  : const SizedBox(),
            ),
            SliverToBoxAdapter(
              child: responsive.setSizeBox(height: 1),
            ),
            SliverToBoxAdapter(
              child: _orderShippingInformation(context, orderModel, isEnLocale),
            ),
            SliverToBoxAdapter(
              child: responsive.setSizeBox(height: 1),
            ),
            SliverToBoxAdapter(
              child: _userInformationContainer(responsive, context),
            )
          ],
        ),
      ),
    );
  }

  Container _userInformationContainer(ResponsiveUtils responsive, BuildContext context) {
    return Container(
              width: double.infinity,
              height: responsive.setHeight(8),
              decoration: BoxDecoration(
                  color: ColorManger.backgroundItem,
                  borderRadius:
                      BorderRadius.circular(responsive.setBorderRadius(3))),
              child: Padding(
                padding: responsive.setPadding(left: 3, right: 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(IconlyBroken.profile,
                            color: ColorManger.brun,
                            size: responsive.setHeight(2.5)),
                        responsive.setSizeBox(width: 2),
                        Text(orderModel.user?.name ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: ColorManger.brun,
                                    fontSize: responsive.setTextSize(3.5))),
                      ],
                    ),
                    responsive.setSizeBox(height: 0.5),
                    Row(
                      children: [
                        Icon(IconlyBroken.message,
                            color: ColorManger.brun,
                            size: responsive.setHeight(2.5)),
                        responsive.setSizeBox(width: 2),
                        Text(orderModel.user?.email ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: ColorManger.brun,
                                    fontSize: responsive.setTextSize(3.5))),
                        responsive.setSizeBox(width: 8),
                        Icon(IconlyBroken.call,
                            color: ColorManger.brun,
                            size: responsive.setHeight(2.5)),
                        responsive.setSizeBox(width: 2),
                        Text(orderModel.user?.phone ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: ColorManger.brun,
                                    fontSize: responsive.setTextSize(3.5))),
                      ],
                    ),
                  ],
                ),
              ),
            );
  }

  Container _noteContainer(ResponsiveUtils responsive, BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManger.backgroundItem,
          borderRadius: BorderRadius.circular(responsive.setBorderRadius(3))),
      child: Padding(
        padding: responsive.setPadding(left: 3, right: 3, top: 2, bottom: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order Notes",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: responsive.setTextSize(3.5))),
            responsive.setSizeBox(height: 1),
            Text(orderModel.notes ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: responsive.setTextSize(3.5))),
          ],
        ),
      ),
    );
  }

  Container _orderShippingInformation(
      BuildContext context, GetOrdersResponseData? order, bool isEnLocale) {
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
                Text(
                    "${context.translate(AppStrings.totalPrice)}  ${order!.totalOrderPrice ?? ''}  ${context.translate(AppStrings.egy)}",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 12.sp)),
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
                Text(
                    order.paymentMethodType == 'cash'
                        ? isEnLocale
                            ? order.paymentMethodType ?? ""
                            : "كاش عند الاستلام"
                        : isEnLocale
                            ? order.paymentMethodType ?? ""
                            : "بطاقة ائتمانية",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 12.sp)),
                const Spacer(),
              ],
            ),
            Divider(
              color: ColorManger.brownLight,
            ),
            SizedBox(
              height: order.shippingAddress != null ? 10.h : 0,
            ),
            order.shippingAddress != null
                ? Row(
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
                            "${order.shippingAddress?.phone ?? ''},   ${order.shippingAddress?.region ?? ''}",
                            softWrap: true,
                            maxLines: null,
                            overflow: TextOverflow.visible,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 12.sp)),
                      ),
                    ],
                  )
                : const SizedBox(),
            SizedBox(
              height: 5.h,
            ),
            order.shippingAddress != null
                ? Divider(
                    color: ColorManger.brownLight,
                  )
                : const SizedBox(),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.translate(AppStrings.shippingPrice),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 12.sp)),
                const Spacer(),
                Text(
                    "${order.shippingPrice ?? ''}  ${context.translate(AppStrings.egy)}",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 12.sp)),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.translate(AppStrings.taxPrice),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 12.sp)),
                const Spacer(),
                Text(
                    "${order.taxPrice ?? ""}  ${context.translate(AppStrings.egy)}",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 12.sp)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverList _productItemSliverList(
      GetOrdersResponseData? order, ResponsiveUtils responsive) {
    final cartItems = order?.cartItems;

    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: cartItems!.length,
            (context, index) {
      return Padding(
          padding: responsive.setPadding(bottom: 1),
          child: Slidable(
            child: Container(
              width: double.infinity,
              height: responsive.setHeight(8),
              decoration: BoxDecoration(
                color: ColorManger.backgroundItem,
                borderRadius:
                    BorderRadius.circular(responsive.setBorderRadius(3)),
              ),
              child: Row(
                children: [
                  responsive.setSizeBox(width: 3),
                  Container(
                    width: responsive.setWidth(16),
                    height: responsive.setHeight(6.5),
                    decoration: BoxDecoration(
                      color: ColorManger.brownLight,
                      borderRadius:
                          BorderRadius.circular(responsive.setBorderRadius(3)),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: order?.cartItems?[index].product?.image ?? '',
                      height: responsive.setHeight(8),
                      placeholder: (context, url) => Image.asset(
                        ImageAsset.picture,
                        height: responsive.setHeight(8),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  responsive.setSizeBox(width: 2),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          cartItems[index].product!.title!,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: responsive.setTextSize(4),
                                  color: ColorManger.brun),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '${cartItems[index].quantity} x ${cartItems[index].price} EGP',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: responsive.setTextSize(3.5),
                                  color: ColorManger.brunLight),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    }));
  }

  Container _orderIdContainer(BuildContext context,
      GetOrdersResponseData? order, ResponsiveUtils responsive) {
    int orderStatus = order!.status!;
    return Container(
      height: responsive.setHeight(8),
      decoration: BoxDecoration(
          color: ColorManger.brownLight,
          borderRadius: BorderRadius.circular(responsive.setBorderRadius(3))),
      child: Row(
        children: [
          responsive.setSizeBox(width: 4),
          Image.asset(
            orderStatus == 5
                ? ImageAsset.orderCancel
                : orderStatus == 4
                    ? ImageAsset.orderDelivered
                    : ImageAsset.shoppingBag,
            height: responsive.setHeight(5),
          ),
          responsive.setSizeBox(width: 4),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.translate(AppStrings.orderID),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: responsive.setTextSize(3.5))),
              responsive.setSizeBox(height: 0.5),
              Text("# ${order.sId ?? ''}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: responsive.setTextSize(3.5))),
            ],
          ),
        ],
      ),
    );
  }
}
