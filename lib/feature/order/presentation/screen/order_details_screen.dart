import '../../../../../core/common/shared/shared_imports.dart'; //

class OrderDetails extends StatelessWidget {
  final GetOrdersResponseData? order;
  const OrderDetails({super.key, this.order});

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
            if (order == null) {
              context.pushReplacementNamed(Routes.bottomNavBarRoute);
            } else {
              context.pop();
            }
          },
        ),
        actions: [
          order != null
              ? order!.status == 0 || order!.status == 1
                  ? TextButton(
                      onPressed: () {
                        cancelBottomSheet(
                            context, order, context.read<PaymentCubit>());
                      },
                      child: Text("Cancel",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: FontConsistent.fontFamilyAcme,
                                  color: ColorManger.redError,
                                  fontSize: 16.sp)),
                    )
                  : const SizedBox()
              : TextButton(
                  onPressed: () {
                    cancelBottomSheet(
                        context, order, context.read<PaymentCubit>());
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
      body: OrderDetailsBody(order: order),
    );
  }

  void cancelBottomSheet(BuildContext context, GetOrdersResponseData? order,
      PaymentCubit paymentCubit) {
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
                      onPressed: () {
                      
                        final orderId = order?.sId ??
                            paymentCubit.createOrderResponseData?.sId;
                        if (orderId != null) {
                          paymentCubit.ordercancelSummit(orderId);
                        }
                      },
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
