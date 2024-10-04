import '../../../../../core/common/shared/shared_imports.dart'; //

class NewProductGrideView extends StatelessWidget {
  const NewProductGrideView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return Column(
      children: [
        Row(
          children: [
            Text(AppStrings.newProductsInStore,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: responsive.setTextSize(4))),
            const Spacer(),
            InkWell(
              onTap: () {
                NavBarNavigator.push(context,
                    screen: const NewProductView(), withNavBar: false);
              },
              child: Text(AppStrings.seeAll,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: responsive.setTextSize(4))),
            ),
          ],
        ),
        responsive.setSizeBox(height: 3),
        BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
            state.whenOrNull(
              getProductSuccess: (data) {
                final wishListCubit = context.read<WishListCubit>();

                for (var element in data.data!) {
                  if (element.inWishlist == true) {
                    wishListCubit.favorites[element.sId!] = element.inWishlist!;
                  } else {
                    wishListCubit.favorites.remove(element.sId!);
                  }
                }
              },
            );
          },
          builder: (context, state) {
            if (state is GetProductError || state is GetProductLoading) {
              return const ProductGridViewLoadingState(
                physics: NeverScrollableScrollPhysics(),
              );
            }
            return ProductGridViewSuccessState(
              dataList: context.read<ProductCubit>().dataList,
              grideViewIndex: 4,
              physics: const NeverScrollableScrollPhysics(),
            );
          },
        )
      ],
    );
  }
}
