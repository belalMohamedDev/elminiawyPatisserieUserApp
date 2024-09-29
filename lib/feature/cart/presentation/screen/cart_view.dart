import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _cartViewAppBar(context),
      body: const CartBody(),
      bottomNavigationBar: _cartViewBottomNavigationBar(),
    );
  }

  BlocBuilder<CartCubit, CartState> _cartViewBottomNavigationBar() {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetCartItemError ||
            state is GetCartItemLoading ||
            context.read<CartCubit>().cartData == null ||
            context.read<CartCubit>().cartData!.data!.cartItems!.isEmpty) {
          return const SizedBox();
        }
        return Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 45.h),
          child: CustomButton(
            // height: 45.h,
            radius: 8.r,

            onPressed: () {
              if (context.read<UserAddressCubit>().addressDataList.isNotEmpty) {
                Navigator.of(context, rootNavigator: !false)
                    .pushNamed(Routes.shippingAddress);
              }
            },
            widget: Text(
              'CheckOut',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 16.sp,
                  color: ColorManger.white,
                  fontWeight: FontWeightManger.semiBold),
            ),
          ),
        );
      },
    );
  }

  AppBar _cartViewAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text("My Cart",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: FontConsistent.fontFamilyAcme,
              color: ColorManger.brun,
              fontSize: 16.sp)),
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
        SizedBox(
          width: 35.w,
        )
      ],
    );
  }
}
