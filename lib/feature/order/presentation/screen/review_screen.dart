import '../../../../../core/common/shared/shared_imports.dart'; //

class ReviewPaymentScreen extends StatelessWidget {
  const ReviewPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CheckOut",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
      ),
      body: const ReviewPaymentBody(),
      bottomNavigationBar: _orderSummary(context),
    );
  }

  Container _orderSummary(BuildContext context) {
    final cart = context.read<CartCubit>();
    final paymentCuibt = context.read<PaymentCubit>();
    final userAddressCubit = context.read<UserAddressCubit>();

    return Container(
      height: 280.h,
      color: ColorManger.backgroundItem,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.brun,
                  fontSize: 15.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  'Cart Total',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 15.sp),
                ),
                const Spacer(),
                Text(
                  '${cart.cartData!.data!.totalCartPrice!} EGP',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brunLight,
                      fontSize: 15.sp),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  'Delivery Fee',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 15.sp),
                ),
                const Spacer(),
                Text(
                  '${cart.cartData!.data!.taxPrice!} EGP',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brunLight,
                      fontSize: 15.sp),
                ),
              ],
            ),
            Divider(
              color: ColorManger.brownLight,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 15.sp),
                ),
                const Spacer(),
                Text(
                  '${cart.cartData!.data!.totalOrderPrice!} EGP',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 15.sp),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocConsumer<PaymentCubit, PaymentState>(
              listener: (context, state) {
                state.whenOrNull(
                    createCashOrderError: (statesCode, errorMessage) =>
                        ShowToast.showToastErrorTop(
                            errorMessage: errorMessage, context: context),
                    createCashOrderSuccess: (data) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.orderPlaced,
                        (route) => false,
                      );
                    });
              },
              builder: (context, state) {
                return CustomButton(
                    onPressed: () {
                      if (paymentCuibt.choosePaymentMethod.startsWith('Cash')) {
                        paymentCuibt.createCashOrderSummit(userAddressCubit
                            .addressDataList[paymentCuibt.selectedIndex].sId!);
                      }
                    },
                    radius: 8.r,
                    widget: state.maybeWhen(
                      createCashOrderLoading: () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.0,
                              strokeAlign: 0.01,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            AppStrings.loading,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontSize: 16.sp,
                                    color: ColorManger.white,
                                    fontWeight: FontWeightManger.semiBold),
                          ),
                        ],
                      ),
                      orElse: () => Text(
                        'Summit Order',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: FontConsistent.fontFamilyAcme,
                            color: ColorManger.white,
                            fontSize: 13.sp),
                      ),
                    ));
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.car_rental_outlined,
                  color: ColorManger.brun,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Order Will be delivered in 90 min - 120 min',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 12.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
