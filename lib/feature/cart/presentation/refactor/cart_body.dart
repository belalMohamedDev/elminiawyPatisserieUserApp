

import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file


class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                        color: ColorManger.brun,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.r),
                        child: CircularProgressIndicator(
                          color: ColorManger.white,
                          strokeWidth: 3.sp,
                        ),
                      ),
                    )),
              ),
          ],
        );
      },
    );
  }
}
