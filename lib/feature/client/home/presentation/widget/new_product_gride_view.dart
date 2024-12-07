import 'package:elminiawy/core/common/shared/shared_imports.dart';


class NewProductGrideView extends StatelessWidget {
  const NewProductGrideView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final responsive = ResponsiveUtils(context);

    return Column(
      children: [


        Row(
          children: [
            Icon(
              IconlyBold.discount,
              color: ColorManger.brun,
              size: responsive.setIconSize(5),
            ),
            responsive.setSizeBox(width: 2),
            // New Products title
            Text(context.translate(AppStrings.newProductsInStore),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: responsive.setTextSize(4))),
            const Spacer(),


            InkWell(
              onTap: () {
                context
                    .pushNamed(
                        Routes.newProduct 
                        );
              },
              child: Text(context.translate(AppStrings.seeAll),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: responsive.setTextSize(3.5))),
            ),
          ],
        ),
        responsive.setSizeBox(
            height: 3),


        BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
         
            state.whenOrNull(
              getNewProductError: (apiErrorModel) {
                context.read<ProductCubit>().fetchGetNewProductToUser();
              },
              getNewProductSuccess: (data) {
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
       
            if (state is GetNewProductError || state is GetNewProductLoading) {
              return const ProductGridViewLoadingState(
                physics:
                    NeverScrollableScrollPhysics(), 
              );
            }


            return ProductGridViewSuccessState(
              dataList: context
                  .read<ProductCubit>()
                  .dataList, 
              grideViewIndex: 4, 
              physics:
                  const NeverScrollableScrollPhysics(), 
            );
          },
        ),
      ],
    );
  }
}
