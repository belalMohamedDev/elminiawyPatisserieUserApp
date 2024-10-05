import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments.
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetCartItemError || state is GetCartItemLoading) {
          return const LoadingCartScreen();
        }

        final cartData = context.read<CartCubit>().cartData;

        if (cartData == null || cartData.data!.cartItems!.isEmpty) {
          return const EmptyCartScreen();
        }

        return Stack(
          children: [
            SuccessCartScreen(cartData: cartData),
            if (state is DeleteCartItemLoading || state is DeleteCartLoading)
              Center(
                child: Container(
                    height: responsive.setHeight(10),
                    width: responsive.setWidth(22),
                    decoration: BoxDecoration(
                        color: ColorManger.brun,
                        borderRadius: BorderRadius.circular(
                            responsive.setBorderRadius(2))),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: ColorManger.white,
                        strokeWidth: 3,
                      ),
                    )),
              ),
          ],
        );
      },
    );
  }
}
