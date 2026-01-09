import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../core/common/shared/shared_imports.dart'; //

class OrderDetailsBody extends StatelessWidget {
  final GetOrdersResponseData? order;
  const OrderDetailsBody({super.key, this.order});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;

    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        state.whenOrNull(
          createCashOrderLoading: () => context.pop(),
          createCashOrderError: (apiErrorModel) => ShowToast.showToastErrorTop(
            errorMessage: apiErrorModel.message!,
            context: context,
          ),
          createCashOrderSuccess: (createOrderResponse) {
            if (order != null) {
              ShowToast.showToastSuccessTop(
                message: context.translate(AppStrings.successToCancelOrder),
                context: context,
              );
              context.pop();
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                if (!context.mounted) return;
                await Future.wait([
                  context.read<PaymentCubit>().getCompleteOrdersSummit(),
                  context.read<PaymentCubit>().getOrdersPendingSummit(),
                ]);
              });
            }
          },
        );
      },
      builder: (context, state) {
        final createOrderResponse = context
            .read<PaymentCubit>()
            .createOrderResponseData;

        return Padding(
          padding: responsive.setPadding(top: 2, bottom: 5, left: 5, right: 5),
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        _orderIdContainer(
                          context,
                          createOrderResponse,
                          order,
                          responsive,
                        ),
                        responsive.setSizeBox(height: 1),
                        _orderStautsStepper(
                          context,
                          createOrderResponse,
                          order,
                          responsive,
                          isEnLocale,
                        ),
                        responsive.setSizeBox(height: 1),
                        _orderShippingInformation(
                          context,
                          createOrderResponse,
                          order,
                          isEnLocale,
                        ),
                        responsive.setSizeBox(height: 1),
                        if (order?.driverId != null) ...[
                          _driverInformationContainer(
                            responsive,
                            context,
                            order,
                          ),
                          responsive.setSizeBox(height: 1),
                        ],
                      ],
                    ),
                  ),
                  _productItemSliverList(
                    createOrderResponse,
                    order,
                    responsive,
                  ),
                ],
              ),
              if (state is CreateCashOrderLoading)
                Center(
                  child: Container(
                    height: responsive.setHeight(10),
                    width: responsive.setWidth(22),
                    decoration: BoxDecoration(
                      color: ColorManger.brun,
                      borderRadius: BorderRadius.circular(
                        responsive.setBorderRadius(2),
                      ),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: ColorManger.white,
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _driverInformationContainer(
    ResponsiveUtils responsive,
    BuildContext context,

    GetOrdersResponseData? order,
  ) {
    return Container(
      width: double.infinity,
      height: responsive.setHeight(10),
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(responsive.setBorderRadius(2.5)),
      ),
      child: Padding(
        padding: responsive.setPadding(left: 3, right: 3, top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                Image.asset(
                  ImageAsset.deliveryBike,

                  height: responsive.setHeight(2.4),
                ),
                responsive.setSizeBox(width: 2),
                Text(
                  context.translate(AppStrings.driverData),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: responsive.setTextSize(4),
                  ),
                ),
              ],
            ),
            SizedBox(height: responsive.setHeight(1.5)),
            Row(
              children: [
                Icon(
                  IconlyBold.profile,
                  color: ColorManger.brun,
                  size: responsive.setHeight(2),
                ),
                responsive.setSizeBox(width: 2),
                Text(
                  "${order?.driverId?.name}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManger.brun,
                    fontSize: responsive.setTextSize(3.5),
                  ),
                ),
                responsive.setSizeBox(width: 10),
                Icon(
                  IconlyBold.call,
                  color: ColorManger.brun,
                  size: responsive.setHeight(2),
                ),
                responsive.setSizeBox(width: 2),
                Text(
                  "${order?.driverId?.phone}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManger.brun,
                    fontSize: responsive.setTextSize(3.5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverList _productItemSliverList(
    OrderResponseData? orderResponse,
    GetOrdersResponseData? order,
    ResponsiveUtils responsive,
  ) {
    final cartItems = order?.cartItems ?? orderResponse?.cartItems;

    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: cartItems!.length, (
        context,
        index,
      ) {
        return Padding(
          padding: responsive.setPadding(bottom: 1),
          child: Slidable(
            child: Container(
              width: double.infinity,
              height: responsive.setHeight(10),
              decoration: BoxDecoration(
                color: ColorManger.backgroundItem,
                borderRadius: BorderRadius.circular(
                  responsive.setBorderRadius(3),
                ),
              ),
              child: Row(
                children: [
                  responsive.setSizeBox(width: 3),
                  Container(
                    width: responsive.setWidth(20),
                    decoration: BoxDecoration(
                      color: ColorManger.brownLight,
                      borderRadius: BorderRadius.circular(
                        responsive.setBorderRadius(3),
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          order?.cartItems?[index].product?.image ??
                          orderResponse?.cartItems?[index].product?.image ??
                          '',
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
                    child: _namePriceAndRatingColumn(
                      order,
                      index,
                      orderResponse,
                      context,
                      responsive,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Column _namePriceAndRatingColumn(
    GetOrdersResponseData? order,
    int index,
    OrderResponseData? orderResponse,
    BuildContext context,
    ResponsiveUtils responsive,
  ) {
    dynamic response = order ?? orderResponse;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          response!.cartItems![index].product!.title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontSize: responsive.setTextSize(3)),
        ),
        responsive.setSizeBox(height: 1),
        IgnorePointer(
          ignoring: true,
          child: RatingBar(
            initialRating: response.cartItems![index].product!.ratingsAverage,
            direction: Axis.horizontal,
            itemSize: responsive.setIconSize(4),
            itemCount: 5,
            allowHalfRating: true,
            itemPadding: responsive.setPadding(left: 0.2, right: 0.2),
            onRatingUpdate: (rating) {},
            ratingWidget: RatingWidget(
              full: Icon(IconlyBold.star, color: ColorManger.brown),
              half: Icon(IconlyBold.star, color: ColorManger.brun),
              empty: Icon(IconlyBroken.star, color: ColorManger.brunLight),
            ),
          ),
        ),
        responsive.setSizeBox(height: 1),
        Text(
          '${context.translate(AppStrings.totalPrice)}   ${response.cartItems![index].totalItemPrice}  ${context.translate(AppStrings.egy)} ',
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontSize: responsive.setTextSize(3)),
        ),
      ],
    );
  }

  Container _orderShippingInformation(
    BuildContext context,
    OrderResponseData? orderResponse,
    GetOrdersResponseData? order,
    bool isEnLocale,
  ) {
    dynamic response = order ?? orderResponse;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 18.w,
          top: 12.h,
          bottom: 15.h,
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 5.w),
                Text(
                  "${context.translate(AppStrings.totalPrice)}  ${response.totalOrderPrice ?? ''}  ${context.translate(AppStrings.egy)}",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 12.sp),
                ),
                SizedBox(width: 30.w),
                const Spacer(),
                Container(
                  height: 40.h,
                  width: 1.w,
                  decoration: BoxDecoration(color: ColorManger.brownLight),
                ),
                const Spacer(),
                Icon(Icons.credit_card, color: ColorManger.brun),
                SizedBox(width: 20.w),
                Text(
                  response.paymentMethodType == 'cash'
                      ? isEnLocale
                            ? "${response.paymentMethodType ?? ""}"
                            : "كاش عند الاستلام"
                      : isEnLocale
                      ? "${response.paymentMethodType ?? ""}"
                      : "بطاقة ائتمانية",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 12.sp),
                ),
                const Spacer(),
              ],
            ),
            Divider(color: ColorManger.brownLight),
            SizedBox(height: response.shippingAddress != null ? 10.h : 0),
            response.shippingAddress != null
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(IconlyBold.location, color: ColorManger.brun),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          "${response.shippingAddress?.phone ?? ''},   ${response.shippingAddress?.region ?? ''}",
                          softWrap: true,
                          maxLines: null,
                          overflow: TextOverflow.visible,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge!.copyWith(fontSize: 12.sp),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            SizedBox(height: 5.h),
            response.shippingAddress != null
                ? Divider(color: ColorManger.brownLight)
                : const SizedBox(),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.translate(AppStrings.shippingPrice),
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 12.sp),
                ),
                const Spacer(),
                Text(
                  "${response.shippingPrice ?? ''}  ${context.translate(AppStrings.egy)}",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 12.sp),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.translate(AppStrings.taxPrice),
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 12.sp),
                ),
                const Spacer(),
                Text(
                  "${response.taxPrice ?? ""}  ${context.translate(AppStrings.egy)}",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 12.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildLine(bool isCompleted, bool isEnLocale) {
    return Padding(
      padding: EdgeInsets.only(
        left: isEnLocale ? 10.w : 0,
        right: isEnLocale ? 0 : 10,
      ),
      child: Column(
        children: List.generate(
          2,
          (index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Container(
              width: isCompleted ? 1.6.w : 1.8.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: isCompleted ? ColorManger.brun : ColorManger.brownLight,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildStep({
    required BuildContext context,
    required bool isCompleted,
    required bool isEnLocale,
    bool isCancelled = false,
    required String title,
    required String subTitle,
    String imagePath = ImageAsset.orderDelivered,
  }) {
    return Row(
      children: [
        SizedBox(width: isCompleted ? 0 : 5.5.w),
        CircleAvatar(
          radius: isCompleted ? 11.r : 5.r,
          backgroundColor: isCancelled
              ? ColorManger.backgroundItem
              : ColorManger.brownLight,
          child: isCompleted ? Image.asset(imagePath) : null,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: isEnLocale ? 20.w : 0,
            right: isEnLocale ? 0 : 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: isCompleted ? ColorManger.brun : ColorManger.brunLight,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(height: isCompleted ? 5.h : 0),
              isCompleted
                  ? Text(
                      subTitle,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(fontSize: 10.sp),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }

  Container _orderStautsStepper(
    BuildContext context,
    OrderResponseData? orderResponse,
    GetOrdersResponseData? order,
    ResponsiveUtils responsive,
    bool isEnLocale,
  ) {
    dynamic response = order ?? orderResponse;

    int orderStatus = response!.status;
    String createAt = response.createdAt;
    String updatedAt = response.updatedAt;
    String paitAt = response.driverDeliveredAt ?? updatedAt;
    String adminAcceptedAt = response.adminAcceptedAt ?? updatedAt;
    String adminCompletedAt = response.adminCompletedAt ?? updatedAt;
    String driverAcceptedAt = response.driverAcceptedAt ?? updatedAt;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(responsive.setBorderRadius(3)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 15.h,
          right: 20.w,
          left: 20.w,
          bottom: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.translate(AppStrings.orderStatus),
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontSize: 18.sp),
            ),
            SizedBox(height: 15.h),
            orderStatus != 5
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStep(
                        context: context,
                        isCompleted: orderStatus >= 0,
                        title: context.translate(AppStrings.orderPlaced),
                        isEnLocale: isEnLocale,
                        subTitle: '${createAt.getFormattedDateAndHourse()} .',
                      ),
                      _buildLine(orderStatus > 0, isEnLocale),
                      _buildStep(
                        context: context,
                        isCompleted: orderStatus >= 1,
                        title: context.translate(AppStrings.preparing),
                        subTitle:
                            '${adminAcceptedAt.getFormattedDateAndHourse()} .',
                        isEnLocale: isEnLocale,
                      ),
                      _buildLine(orderStatus > 1, isEnLocale),
                      _buildStep(
                        context: context,
                        isCompleted: orderStatus >= 2,
                        title: context.translate(
                          AppStrings.theOrderAcceptedByRestaurant,
                        ),
                        isEnLocale: isEnLocale,
                        subTitle:
                            '${adminCompletedAt.getFormattedDateAndHourse()} .',
                      ),
                      _buildLine(orderStatus > 2, isEnLocale),
                      _buildStep(
                        context: context,
                        isCompleted: orderStatus >= 3,
                        isEnLocale: isEnLocale,
                        title: context.translate(AppStrings.onItsWay),
                        subTitle:
                            '${driverAcceptedAt.getFormattedDateAndHourse()} .',
                      ),
                      _buildLine(orderStatus > 3, isEnLocale),
                      _buildStep(
                        context: context,
                        isCompleted: orderStatus >= 4,
                        isEnLocale: isEnLocale,
                        title: context.translate(AppStrings.delivered),
                        subTitle: '${paitAt.getFormattedDateAndHourse()} .',
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStep(
                        context: context,
                        isCompleted: orderStatus == 5,
                        title: context.translate(AppStrings.orderPlaced),
                        isEnLocale: isEnLocale,
                        subTitle: '${createAt.getFormattedDateAndHourse()} .',
                      ),
                      _buildLine(orderStatus == 5, isEnLocale),
                      _buildStep(
                        isCancelled: true,
                        context: context,
                        isCompleted: orderStatus == 5,
                        title: context.translate(AppStrings.cancelled),
                        subTitle: context.translate(
                          AppStrings.yourOrderWasCancelled,
                        ),
                        imagePath: ImageAsset.orderCancel,
                        isEnLocale: isEnLocale,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Container _orderIdContainer(
    BuildContext context,
    OrderResponseData? orderResponse,
    GetOrdersResponseData? order,
    ResponsiveUtils responsive,
  ) {
    dynamic response = order ?? orderResponse;

    int orderStatus = response!.status!;
    return Container(
      height: responsive.setHeight(8),
      decoration: BoxDecoration(
        color: ColorManger.brownLight,
        borderRadius: BorderRadius.circular(responsive.setBorderRadius(3)),
      ),
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
              Text(
                context.translate(AppStrings.orderID),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: responsive.setTextSize(3.5),
                ),
              ),
              responsive.setSizeBox(height: 0.5),
              Text(
                "# ${response!.sId ?? ''}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: responsive.setTextSize(3.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
