import '../../../../../core/common/shared/shared_imports.dart'; //

class OrdersTab extends StatelessWidget {
  final List<GetOrdersResponseData> getOrdersResponseData;

  const OrdersTab({super.key, required this.getOrdersResponseData});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return ListView.builder(
      itemCount: getOrdersResponseData.length,
      itemBuilder: (context, index) {
        final order = getOrdersResponseData[index];
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: responsive.setWidth(4),
              vertical: responsive.setHeight(0.5)),
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
                    width: responsive.setWidth(20),
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
                        height: 2.h,
                      ),
                      Text(
                        '${context.translate(AppStrings.totalPrice)}  ${order.totalOrderPrice}  ${context.translate(AppStrings.egy)}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        order.status == 4
                            ? context.translate(AppStrings.delivered)
                            : order.status == 5
                                ? context.translate(AppStrings.cancelled)
                                : 'Processing',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: order.status == 5
                                ? ColorManger.redError
                                : order.status == 4
                                    ? Colors.green
                                    : const Color.fromARGB(255, 194, 155, 38),
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    IconlyBold.arrowRightCircle,
                    color: ColorManger.brun,
                    size: 25.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
