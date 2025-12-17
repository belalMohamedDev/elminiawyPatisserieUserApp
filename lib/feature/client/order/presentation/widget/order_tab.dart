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
            vertical: responsive.setHeight(0.5),
          ),
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
                  SizedBox(width: 10.w),

                  Container(
                    width: responsive.setWidth(20),
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: ColorManger.brownLight,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.r),
                      child: CachedNetworkImage(
                        imageUrl: order.cartItems!.first.product!.image ?? '',
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Image.asset(ImageAsset.picture, fit: BoxFit.cover),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${context.translate(AppStrings.orderNum)} #${order.sId}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                        ),

                        SizedBox(height: 5.h),

                        Text(
                          '${context.translate(AppStrings.totalPrice)} '
                          '${order.totalOrderPrice} '
                          '${context.translate(AppStrings.egy)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                fontSize: 11.5.sp,
                                color: Colors.grey.shade700,
                              ),
                        ),

                        SizedBox(height: 6.h),

                        Text(
                          order.status == 4
                              ? context.translate(AppStrings.delivered)
                              : order.status == 5
                              ? context.translate(AppStrings.cancelled)
                              : context.translate(AppStrings.processing),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                fontSize: 11.5.sp,
                                fontWeight: FontWeight.w500,
                                color: order.status == 5
                                    ? ColorManger.redError
                                    : order.status == 4
                                    ? Colors.green
                                    : const Color(0xFFC29B26),
                              ),
                        ),
                      ],
                    ),
                  ),

                  /// Arrow
                  Icon(
                    IconlyBold.arrowLeftCircle,
                    color: ColorManger.brun,
                    size: 24.sp,
                  ),

                  SizedBox(width: 10.w),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
