import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class ProductGridViewSuccessState extends StatelessWidget {
  final List<DataProductResponse>? dataList;
  final bool isSearchActive;
  final List<WishListProductData>? wishListData;
  final List<Products>? allProductList;

  final int? grideViewIndex;
  final ScrollPhysics? physics;

  const ProductGridViewSuccessState({
    super.key,
    this.dataList,
    this.isSearchActive = false,
    this.grideViewIndex,
    this.physics,
    this.wishListData,
    this.allProductList,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    final List displayList = (dataList ?? wishListData ?? allProductList ?? []);

    final int maxItemCount = displayList.length;

    final int itemCount =
        (grideViewIndex != null && grideViewIndex! <= maxItemCount)
            ? grideViewIndex!
            : maxItemCount;

    return GridView.count(
        addAutomaticKeepAlives: true,
        shrinkWrap: true,
        physics: physics,
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 15,
        childAspectRatio: 0.7,
        children: List.generate(
          itemCount,
          (index) => InkWell(
            onTap: () =>
                showSortBottomSheet(context, index, displayList, responsive),
            child: Container(
              decoration: BoxDecoration(
                color: ColorManger.backgroundItem,
                borderRadius:
                    BorderRadius.circular(responsive.setBorderRadius(2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _wishListAndImageStack(
                      context, index, displayList, responsive),
                  _productTitleAndSomeInformationText(
                      responsive, displayList, index, context)
                ],
              ),
            ),
          ),
        ));
  }

  SizedBox _productTitleAndSomeInformationText(ResponsiveUtils responsive,
      List<dynamic> displayList, int index, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: responsive.setHeight(10),
      child: Stack(
        children: [
          Padding(
            padding: responsive.setPadding(left: 4, top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayList[index].title!,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: responsive.setTextSize(4)),
                ),
                responsive.setSizeBox(height: 0.2),
                Text(
                  displayList[index].description!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: responsive.setTextSize(3)),
                ),
                responsive.setSizeBox(height: 0.5),
                Text(
                  " ${displayList[index].price!} ${AppStrings.egy}",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: responsive.setTextSize(3)),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                context
                    .read<CartCubit>()
                    .addItemToCart(displayList[index].sId!);
              },
              child: Container(
                height: responsive.setHeight(4),
                width: responsive.setWidth(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight:
                            Radius.circular(responsive.setBorderRadius(2))),
                    color: ColorManger.brun),
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                        addItemToCartLoading: (id) {
                          if (id == displayList[index].sId!) {
                            return Center(
                              child: SizedBox(
                                height: responsive.setHeight(2),
                                width: responsive.setWidth(4),
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.0,
                                  strokeAlign: 0.01,
                                ),
                              ),
                            );
                          } else {
                            return Icon(Icons.add, color: ColorManger.white);
                          }
                        },
                        orElse: () =>
                            Icon(Icons.add, color: ColorManger.white));
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _wishListAndImageStack(BuildContext context, int index,
      List displayList, ResponsiveUtils responsive) {
    final product = displayList[index];

    return Container(
      height: responsive.setHeight(18),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(responsive.setBorderRadius(2)),
              topRight: Radius.circular(responsive.setBorderRadius(2))),
          color: ColorManger.brownLight),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 2,
            child: IconButton(
              onPressed: () {
                context
                    .read<WishListCubit>()
                    .addOrRemoveProductFromWish(product.sId!);
              },
              icon: BlocConsumer<WishListCubit, WishListState>(
                listener: (context, state) {
                  state.whenOrNull(
                    addOrRemoveProductFromWishListError:
                        (statesCode, errorMessage) =>
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

                  return Container(
                    height: responsive.setHeight(4),
                    width: responsive.setWidth(8.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            responsive.setBorderRadius(2)),
                        color: ColorManger.offWhite),
                    child: Icon(
                        isInWishlist ? IconlyBold.heart : IconlyBroken.heart,
                        color: ColorManger.brunLight),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: responsive.setPadding(top: 2.5, right: 5),
            child: CachedNetworkImage(
              imageUrl: product.image!,
              placeholder: (context, url) => const LoadingShimmer(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }

  void showSortBottomSheet(BuildContext context, int index, List displayList,
      ResponsiveUtils responsive) {
    showCupertinoModalBottomSheet(
        useRootNavigator: true,
        barrierColor: Colors.black54,
        elevation: responsive.setBorderRadius(2),
        context: context,
        builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: instance<ProductCubit>(),
                ),
                BlocProvider.value(
                  value: instance<WishListCubit>(),
                ),
                BlocProvider.value(
                  value: instance<CartCubit>(),
                ),
              ],
              child: ProductBottomSheet(
                index: index,
                displayList: displayList,
              ),
            )).then((value) {
      context.read<CartCubit>().quantityItem = 1;
    });
  }
}
