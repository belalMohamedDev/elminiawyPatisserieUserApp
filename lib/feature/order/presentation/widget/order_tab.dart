import '../../../../../core/common/shared/shared_imports.dart'; //

class OrdersTab extends StatelessWidget {
  final List<GetOrdersResponseData> getOrdersResponseData;

  const OrdersTab({super.key, required this.getOrdersResponseData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: getOrdersResponseData.length,
      itemBuilder: (context, index) {
        final order = getOrdersResponseData[index];
        return Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 15.h),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: instance<PaymentCubit>(),
                    child: OrderDetails(order: order),
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 75.h,
              decoration: BoxDecoration(
                color: ColorManger.backgroundItem,
                borderRadius: BorderRadius.circular(10.r),
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
                      imageUrl: order.cartItems!.first.product!.image ?? '',
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${context.translate(AppStrings.orderNum)} ${order.sId}',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        '${context.translate(AppStrings.totalPrice)}  ${order.totalOrderPrice}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        order.status == 0
                            ? context.translate(AppStrings.orderPlaced)
                            : order.status == 1
                                ? context.translate(
                                    AppStrings.yourOrderIsBeingPrepared)
                                : order.status == 2
                                    ? context.translate(
                                        AppStrings.theOrderAcceptedByRestaurant)
                                    : order.status == 3
                                        ? context.translate(
                                            AppStrings.yourOrderIsOnItsWay)
                                        : order.status == 4
                                            ? context.translate(AppStrings
                                                .yourOrderWasDeliveredSuccessfully)
                                            : order.status == 5
                                                ? context.translate(AppStrings
                                                    .yourOrderWasCancelled)
                                                : '',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: order.status == 5
                                ? ColorManger.redError
                                : order.status == 4
                                    ? Colors.green
                                    : const Color.fromARGB(255, 194, 155, 38),
                            fontSize: 12.sp),
                      ),
                    ],
                  )
                  // const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
