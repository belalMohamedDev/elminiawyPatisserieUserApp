import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class SuccessCartScreen extends StatelessWidget {
  const SuccessCartScreen({
    super.key,
    required this.cartData,
  });

  final CartResponse? cartData;

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments.
    final responsive = ResponsiveUtils(context);

    return Padding(
      padding: responsive.setPadding(left: 4, right: 4, top: 3),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: responsive.setPadding(bottom: 1),
                  child: ProductCartItem(
                      cartItems: cartData!.data!.cartItems![index]),
                );
              },
              childCount: cartData!.data!.cartItems?.length ?? 0,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: responsive.setPadding(left: 2, top: 2, bottom: 2),
                  child: Text(
                    AppStrings.saveOnYourOrder,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: responsive.setTextSize(4.2)),
                  ),
                ),
                const ApplyCouponCode(),
                Padding(
                  padding: responsive.setPadding(left: 2, top: 2, bottom: 2),
                  child: Text(
                    AppStrings.paymentSummary,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: responsive.setTextSize(4.2)),
                  ),
                ),
                PaymentSummary(cartData: cartData!.data!)
              ],
            ),
          ),
        ], // Other slivrs for remaining widgets
      ),
    );
  }
}
