import '../../../../../core/common/shared/shared_imports.dart'; //

class ReviewPaymentScreen extends StatelessWidget {
  const ReviewPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.translate(AppStrings.checkOut),
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontSize: responsive.setTextSize(4)),
        ),
      ),
      body: const ReviewPaymentBody(),
      bottomNavigationBar: _orderSummary(context),
    );
  }

  Widget _orderSummary(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return BlocBuilder<CartCubit, CartState>(
          builder: (context, cartState) {
            final cartCubit = context.read<CartCubit>();
            final paymentCubit = context.read<PaymentCubit>();
            final addressCubit = context.read<UserAddressCubit>();

            final cartData = cartCubit.cartData?.data;
            if (cartData == null) {
              return const SizedBox();
            }

            /// ===== Calculations =====
            final totalCartPrice = cartData.totalCartPrice ?? 0;
            final priceAfterDiscount = cartData.totalPriceAfterDiscount ?? 0;
            final tax = cartData.taxPrice ?? 0;
            final shipping = cartData.shippingPrice ?? 0;
            final totalOrder = cartData.totalOrderPrice ?? 0;

            /// Store pickup total (admin only)

            final storePickupTotal = double.parse(
              (totalOrder - tax - shipping).toStringAsFixed(2),
            );

            final isAdmin = AppInitialRoute.role == "admin";
            final isPhoneOrder = paymentCubit.isPhoneOrder;

            final finalTotal = isAdmin
                ? (isPhoneOrder ? totalOrder : storePickupTotal)
                : totalOrder;

            return Container(
              height: responsive.setHeight(32),
              color: ColorManger.backgroundItem,
              child: Padding(
                padding: responsive.setPadding(left: 5, right: 5, top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ===== Title =====
                    Text(
                      context.translate(AppStrings.orderSummary),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: responsive.setTextSize(4),
                      ),
                    ),

                    responsive.setSizeBox(height: 1),

                    /// ===== Cart total =====
                    RowTextOrderSummary(
                      orderprice: totalCartPrice,
                      orderText: context.translate(AppStrings.cartTotal),
                    ),

                    responsive.setSizeBox(height: 1),

                    /// ===== After discount =====
                    RowTextOrderSummary(
                      orderprice: priceAfterDiscount,
                      orderText: context.translate(
                        AppStrings.priceAfterDiscount,
                      ),
                    ),

                    Divider(color: ColorManger.brownLight),

                    responsive.setSizeBox(height: 1),

                    /// ===== Final total =====
                    Row(
                      children: [
                        Text(
                          context.translate(AppStrings.total),
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontSize: responsive.setTextSize(4)),
                        ),
                        const Spacer(),
                        Text(
                          '$finalTotal ${context.translate(AppStrings.egy)}',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontSize: responsive.setTextSize(4)),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    /// ===== Submit Order Button =====
                    BlocConsumer<PaymentCubit, PaymentState>(
                      listener: (context, state) {
                        state.whenOrNull(
                          createCashOrderError: (error) {
                            ShowToast.showToastErrorTop(
                              errorMessage: error.message!,
                              context: context,
                            );
                          },
                          createCashOrderSuccess: (_) {
                            paymentCubit.resetOrderData();

                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              isAdmin ? Routes.adminMenue : Routes.orderPlaced,
                              (_) => false,
                            );
                          },
                        );
                      },
                      builder: (context, state) {
                        return CustomButton(
                          onPressed: () {
                            if (!paymentCubit.choosePaymentMethod.startsWith(
                              'Cash',
                            )) {
                              return;
                            }

                            paymentCubit.createCashOrderSummit(
                              orderSource: isAdmin
                                  ? paymentCubit.orderSourceForApi
                                  : "app",
                              shippingAddressId: isAdmin
                                  ? null
                                  : addressCubit
                                        .addressDataList[paymentCubit
                                            .selectedIndex]
                                        .sId!,
                              nearbyStoreAddress:
                                  addressCubit.addressDataList.isEmpty
                                  ? null
                                  : addressCubit
                                        .addressDataList[paymentCubit
                                            .selectedIndex]
                                        .nearbyStoreAddress,
                            );
                          },
                          widget: state.maybeWhen(
                            createCashOrderLoading: () =>
                                _loadingButton(context),
                            orElse: () => Text(
                              context.translate(AppStrings.summitOrder),
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(
                                    fontSize: responsive.setTextSize(3.8),
                                  ),
                            ),
                          ),
                        );
                      },
                    ),

                    responsive.setSizeBox(height: 2),

                    /// ===== Footer =====
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.car_rental_outlined,
                          color: ColorManger.brun,
                        ),
                        responsive.setSizeBox(width: 2),
                        Text(
                          context.translate(AppStrings.orderWillBeDelivered),
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontSize: responsive.setTextSize(4)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _loadingButton(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: responsive.setHeight(2),
          width: responsive.setWidth(4),
          child: CircularProgressIndicator(
            color: ColorManger.white,
            strokeWidth: 2,
          ),
        ),
        SizedBox(width: responsive.setWidth(2)),
        Text(
          context.translate(AppStrings.loading),
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: responsive.setTextSize(3.8),
          ),
        ),
      ],
    );
  }
}
