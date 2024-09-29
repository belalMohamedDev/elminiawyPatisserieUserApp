
import '../../../../../core/common/shared/shared_imports.dart'; //

class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet(
      {super.key, required this.index, required this.displayList});

  final int index;
  final List displayList;

  @override
  Widget build(BuildContext context) {
    final product = displayList[index];

    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: SizedBox(
        height: 350.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _productImageRatingNameAndFavoritRow(product, context),
            SizedBox(
              height: 20.h,
            ),
            Text(
              '  Description',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.brown,
                  fontSize: 15.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '  ${displayList[index].description!}',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.brunLight,
                  fontSize: 15.sp),
            ),
            SizedBox(
              height: 40.h,
            ),
            _addRemoveAndAddToCartButton(context)
          ],
        ),
      ),
    );
  }

  BlocConsumer _addRemoveAndAddToCartButton(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        state.whenOrNull(
          deleteCartItemError: (statesCode, errorMessage) =>
              ShowToast.showToastErrorTop(
                  errorMessage: errorMessage, context: context),
          addItemToCartSuccess: (data, quantity) =>
              ShowToast.showToastSuccessTop(
                  message: data.message!, context: context),
        );
      },
      builder: (context, state) {
        return Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: () => context.read<CartCubit>().decreaseQuantity(),
              child: CircleAvatar(
                backgroundColor: ColorManger.brownLight,
                child: Icon(
                  Icons.remove,
                  color: ColorManger.brown,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              '${context.read<CartCubit>().quantityItem}',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.brown,
                  fontSize: 15.sp),
            ),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: () => context.read<CartCubit>().increaseQuantity(),
              child: CircleAvatar(
                backgroundColor: ColorManger.brown,
                child: Icon(
                  Icons.add_rounded,
                  color: ColorManger.white,
                ),
              ),
            ),
            const Spacer(),
            CustomButton(
              height: 50.h,
              width: 190.w,
              onPressed: () {
                context
                    .read<CartCubit>()
                    .addItemToCart(displayList[index].sId!);
              },
              widget: state.maybeWhen(
                addItemToCartLoading: () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.0,
                        strokeAlign: 0.01,
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      AppStrings.loading,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 14.sp,
                          color: ColorManger.white,
                          fontWeight: FontWeightManger.semiBold),
                    ),
                  ],
                ),
                orElse: () => Text(
                  'Add To Cart',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 14.sp,
                      color: ColorManger.white,
                      fontWeight: FontWeightManger.semiBold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Row _productImageRatingNameAndFavoritRow(product, BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Container(
            decoration: BoxDecoration(
              color: ColorManger.backgroundItem,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: CachedNetworkImage(
              imageUrl: product.image!,
              height: 120.h,
              placeholder: (context, url) => const LoadingShimmer(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        _namePriceAndRatingColumn(context),
        const Spacer(),
        _wishListContainer(context, product),
      ],
    );
  }

  Padding _namePriceAndRatingColumn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            displayList[index].title!,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 15.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          RatingBar(
              initialRating: displayList[index].ratingsAverage!,
              direction: Axis.horizontal,
              itemSize: 15.sp,
              itemCount: 5,
              allowHalfRating: true,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
              onRatingUpdate: (rating) {},
              ratingWidget: RatingWidget(
                  full: Icon(
                    IconlyBold.star,
                    color: ColorManger.brown,
                  ),
                  half: Icon(
                    IconlyBold.star,
                    color: ColorManger.brun,
                  ),
                  empty: Icon(
                    IconlyBroken.star,
                    color: ColorManger.brunLight,
                  ))),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Price:   ${displayList[index].price!}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brunLight,
                fontSize: 15.sp),
          ),
        ],
      ),
    );
  }

  Container _wishListContainer(BuildContext context, product) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: IconButton(
        onPressed: () {
          context
              .read<WishListCubit>()
              .addOrRemoveProductFromWish(product.sId!);
        },
        icon: BlocConsumer<WishListCubit, WishListState>(
          listener: (context, state) {
            state.whenOrNull(
              addOrRemoveProductFromWishListError: (statesCode, errorMessage) =>
                  ShowToast.showToastErrorTop(
                      errorMessage: errorMessage, context: context),
            );
          },
          builder: (context, state) {
            bool isInWishlist = context
                    .read<WishListCubit>()
                    .favorites
                    .containsKey(product.sId) &&
                context.read<WishListCubit>().favorites[product.sId]!;

            return Icon(isInWishlist ? IconlyBold.heart : IconlyBroken.heart,
                color: ColorManger.brunLight);
          },
        ),
      ),
    );
  }
}
