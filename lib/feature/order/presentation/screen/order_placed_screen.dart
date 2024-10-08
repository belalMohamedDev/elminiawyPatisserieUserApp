import '../../../../../core/common/shared/shared_imports.dart'; //

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OrderPlacedBody(),
    );
  }
}

class OrderPlacedBody extends StatelessWidget {
  const OrderPlacedBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return Padding(
      padding: responsive.setPadding(left: 5, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(JsonAsset.congrat),
          responsive.setSizeBox(height: 3),
          Text(AppStrings.orderPlaced,
              style: Theme.of(context).textTheme.titleLarge),
          responsive.setSizeBox(height: 2),
          Padding(
            padding: responsive.setPadding(left: 3, right: 2),
            child: Text(
                "${AppStrings.thankYouForPurchasingFromElminiawy}${context.read<PaymentCubit>().createOrderResponseData!.sId}",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: responsive.setTextSize(4))),
          ),
          responsive.setSizeBox(height: 3),
          CustomButton(
              onPressed: () {
                context.pushReplacementNamed(Routes.bottomNavBarRoute);
              },
              widget: Text(
                AppStrings.backToHome,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize:
                          responsive.setTextSize(3.8), // Responsive text size
                    ),
              )),
          responsive.setSizeBox(height: 2),
          CustomButton(
            color: ColorManger.brunLight,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.orderDetails,
                (route) => false,
              );
            },
            widget: Text(
              AppStrings.trackOrder,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize:
                        responsive.setTextSize(3.8), // Responsive text size
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
