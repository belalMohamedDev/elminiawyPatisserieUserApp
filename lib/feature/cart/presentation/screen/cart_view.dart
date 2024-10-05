import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments.
    return Scaffold(
      appBar: _cartViewAppBar(context),
      body: const CartBody(),
   
    );
  }

  AppBar _cartViewAppBar(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments.
    final responsive = ResponsiveUtils(context);
    return AppBar(
      centerTitle: true,
      title: Text(
        AppStrings.myCart,
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
        responsive.setSizeBox(width: 5),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is GetCartItemError ||
                state is GetCartItemLoading ||
                context.read<CartCubit>().cartData == null ||
                context.read<CartCubit>().cartData!.data!.cartItems!.isEmpty) {
              return const SizedBox();
            }
            return Padding(
              padding: responsive.setPadding(bottom: 1),
              child: InkWell(
                  onTap: () {
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
                  child: Image.asset(
                    ImageAsset.checkOut,
                    height: responsive.setHeight(3.5),
                  )),
            );
          },
        ),
        responsive.setSizeBox(width: 6),
      ],
    );
  }
}
