import '../../../../../core/common/shared/shared_imports.dart'; //

class ReviewPaymentScreen extends StatelessWidget {
  const ReviewPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments.
    final responsive = ResponsiveUtils(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.checkOut,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: responsive.setTextSize(4)),
        ),
      ),
      body: const ReviewPaymentBody(),
      bottomNavigationBar: _orderSummary(context),
    );
  }

  Container _orderSummary(BuildContext context) {
    final cart = context.read<CartCubit>();
    final paymentCuibt = context.read<PaymentCubit>();
    final userAddressCubit = context.read<UserAddressCubit>();

    // Initialize the ResponsiveUtils to handle responsive layout adjustments.
    final responsive = ResponsiveUtils(context);
    return Container(
      height: responsive.setHeight(32),
      color: ColorManger.backgroundItem,
      child: Padding(
        padding: responsive.setPadding(left: 5, right: 5, top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.orderSummary,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: responsive.setTextSize(4)),
            ),
            responsive.setSizeBox(height: 1),
            Row(
              children: [
                Text(
                  AppStrings.cartTotal,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: responsive.setTextSize(4)),
                ),
                const Spacer(),
                Text(
                  '${cart.cartData!.data!.totalCartPrice!}   ${AppStrings.egy}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: responsive.setTextSize(4)),
                ),
              ],
            ),
            responsive.setSizeBox(height: 1),
            Row(
              children: [
                Text(
                  AppStrings.deliveryFee,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: responsive.setTextSize(4)),
                ),
                const Spacer(),
                Text(
                  '${cart.cartData!.data!.taxPrice!}   ${AppStrings.egy}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: responsive.setTextSize(4)),
                ),
              ],
            ),
            Divider(
              color: ColorManger.brownLight,
            ),
            responsive.setSizeBox(height: 1),
            Row(
              children: [
                Text(
                  AppStrings.total,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: responsive.setTextSize(4)),
                ),
                const Spacer(),
                Text(
                  '${cart.cartData!.data!.totalOrderPrice!}   ${AppStrings.egy}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: responsive.setTextSize(4)),
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
                    widget: state.maybeWhen(
                      createCashOrderLoading: () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: responsive.setHeight(2),
                            width: responsive.setWidth(4),
                            child: CircularProgressIndicator(
                              color: ColorManger.white,
                              strokeWidth: 2.0,
                              strokeAlign: 0.01,
                            ),
                          ),
                          SizedBox(
                            width: responsive.setHeight(
                                2), // Spacing between the indicator and text
                          ),
                          Text(
                            AppStrings.loading,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontSize: responsive
                                      .setTextSize(3.8), // Dynamic text size
                                ),
                          ),
                        ],
                      ),
                      orElse: () => Text(
                        AppStrings.summitOrder,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontSize: responsive.setTextSize(
                                      3.8), // Adjusted font size for responsiveness
                                ),
                      ),
                    ));
              },
            ),
            responsive.setSizeBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.car_rental_outlined,
                  color: ColorManger.brun,
                ),
                responsive.setSizeBox(width: 2),
                Text(
                  AppStrings.orderWillBeDelivered,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: responsive.setTextSize(4)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
