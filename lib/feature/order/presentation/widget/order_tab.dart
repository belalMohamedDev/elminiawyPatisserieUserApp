

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
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
          child: InkWell(
            onTap: () {
              NavBarNavigator.push(context,
                  screen: OrderDetails(
                    order: order,
                  ),
                  withNavBar: false);
            },
            child: Container(
              width: double.infinity,
              height: 80.h,
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
                        'Order No #${order.sId}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: FontConsistent.fontFamilyAcme,
                            color: ColorManger.brun,
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        order.createdAt!.getFormattedDate(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: FontConsistent.fontFamilyAcme,
                            color: ColorManger.brunLight,
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            order.status == 0
                                ? "Order Placed"
                                : order.status == 1
                                    ? "Preparing"
                                    : order.status == 2
                                        ? "On its way"
                                        : order.status == 3
                                            ? "Delivered"
                                            : order.status == 4
                                                ? "Cancelled"
                                                : '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontFamily: FontConsistent.fontFamilyAcme,
                                    color: order.status == 4
                                        ? ColorManger.redError
                                        : Colors.green,
                                    fontSize: 12.sp),
                          ),
                          SizedBox(
                            width: 130.w,
                          ),
                          Text(
                            '${order.totalOrderPrice}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontFamily: FontConsistent.fontFamilyAcme,
                                    color: ColorManger.brun,
                                    fontSize: 18.sp),
                          ),
                        ],
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
