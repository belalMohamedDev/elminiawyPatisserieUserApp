

import '../../../../../core/common/shared/shared_imports.dart'; //

class NewProductGrideView extends StatelessWidget {
  const NewProductGrideView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("New Products in Store",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.brun,
                    fontSize: 16.sp)),
            const Spacer(),
            InkWell(
              onTap: () {
                NavBarNavigator.push(context,
                    screen: const NewProductView(), withNavBar: false);
              },
              child: Text("See all",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 14.sp)),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
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
