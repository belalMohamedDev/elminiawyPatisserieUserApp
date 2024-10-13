import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments.
    return Scaffold(
      appBar: _cartViewAppBar(context),
      body: const CartBody(),
      bottomNavigationBar: _orderSummary(context),
    );
  }

  AppBar _cartViewAppBar(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments.
    final responsive = ResponsiveUtils(context);
    return AppBar(
      centerTitle: true,
      title: Text(
       context.translate(AppStrings.myCart) ,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: responsive.setTextSize(4)), // Responsive font size
      ),
      actions: [
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is GetCartItemError ||
                state is GetCartItemLoading ||
                context.read<CartCubit>().cartData == null ||
                context.read<CartCubit>().cartData!.data!.cartItems!.isEmpty) {
              return const SizedBox();
            }
            return InkWell(
              onTap: () {
                context.read<CartCubit>().removeCartLogic();
              },
              child: Icon(
                IconlyBold.delete,
                color: ColorManger.brunLight,
              ),
            );
          },
        ),
        responsive.setSizeBox(width: 9),
    
      ],
    );
  }

  BlocBuilder _orderSummary(BuildContext context) {
    final cart = context.read<CartCubit>();

    // Initialize the ResponsiveUtils to handle responsive layout adjustments.
    final responsive = ResponsiveUtils(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetCartItemError ||
            state is GetCartItemLoading ||
            context.read<CartCubit>().cartData == null ||
            context.read<CartCubit>().cartData!.data!.cartItems!.isEmpty) {
          return const SizedBox();
        }
        return Container(
          height: responsive.setHeight(30),
          color: ColorManger.backgroundItem,
          child: Padding(
            padding: responsive.setPadding(left: 5, right: 5, top: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                responsive.setSizeBox(height: 1),
                RowTextOrderSummary(
                  orderprice: cart.cartData!.data!.totalCartPrice!,
                  orderText:context.translate(AppStrings.subTotal),
                ),
                responsive.setSizeBox(height: 1),
                RowTextOrderSummary(
                  orderprice: cart.cartData!.data!.taxPrice!,
                  orderText: context.translate(AppStrings.tax) ,
                ),
                responsive.setSizeBox(height: 1),
                RowTextOrderSummary(
                  orderprice: cart.cartData!.data!.shippingPrice!,
                  orderText: context.translate(AppStrings.shippingPrice) ,
                ),
                Divider(
                  color: ColorManger.brownLight,
                ),
                responsive.setSizeBox(height: 1),
                RowTextOrderSummary(
                  orderprice: cart.cartData!.data!.totalOrderPrice!,
                  orderText: context.translate(AppStrings.cartTotal) ,
                ),
                responsive.setSizeBox(height: 2),
                CustomButton(
                  onPressed: () {
                    if (context
                        .read<UserAddressCubit>()
                        .addressDataList
                        .isNotEmpty) {
                      Navigator.of(context, rootNavigator: !false)
                          .pushNamed(Routes.shippingAddress);
                    } else {
                      Navigator.of(context, rootNavigator: !false)
                          .pushNamed(Routes.map);

                      context.read<UserAddressCubit>().isPaymentAddress = true;
                    }
                  },
                  widget: Text(
                   context.translate(AppStrings.checkOutOrder) ,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: responsive.setTextSize(
                              3.8), // Adjusted font size for responsiveness
                        ),
                  ),
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
                    context.translate(AppStrings.orderWillBeDelivered)  ,
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
      },
    );
  }
}
