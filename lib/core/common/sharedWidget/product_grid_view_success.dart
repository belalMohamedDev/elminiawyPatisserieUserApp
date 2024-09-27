

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
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.75,
        children: List.generate(
          itemCount,
          (index) => InkWell(
            onTap: () => showSortBottomSheet(context, index, displayList),
            child: Container(
              decoration: BoxDecoration(
                color: ColorManger.backgroundItem,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _wishListAndImageStack(context, index, displayList),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      displayList[index].title!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brun,
                          fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: Text(
                      displayList[index].description!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brunLight,
                          fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: Text(
                      " ${displayList[index].price!}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorManger.brunLight,
                          fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Stack _wishListAndImageStack(
      BuildContext context, int index, List displayList) {
    final product = displayList[index];

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 105.w, top: 5.h),
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
                      (statesCode, errorMessage) => ShowToast.showToastErrorTop(
                          errorMessage: errorMessage, context: context),
                );
              },
              builder: (context, state) {
                bool isInWishlist = context
                        .read<WishListCubit>()
                        .favorites
                        .containsKey(product.sId) &&
                    context.read<WishListCubit>().favorites[product.sId]!;

                return Icon(
                    isInWishlist ? IconlyBold.heart : IconlyBroken.heart,
                    color: ColorManger.brunLight);
              },
            ),
          ),
        ),
        allProductList != null || isSearchActive==true
            ? const SizedBox()
            : Image.asset(
                ImageAsset.newItem,
                height: 40.h,
              ),
        Padding(
          padding: EdgeInsets.only(top: 25.h, left: 25.w),
          child: CachedNetworkImage(
            imageUrl: product.image!,
            height: 80.h,
            width: 100.w,
            placeholder: (context, url) => const LoadingShimmer(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ],
    );
  }

  void showSortBottomSheet(BuildContext context, int index, List displayList) {
    showCupertinoModalBottomSheet(
        useRootNavigator: true,
        barrierColor: Colors.black54,
        elevation: 20.r,
        context: context,
        builder: (context) => ProductBottomSheet(
              index: index,
              displayList: displayList,
            )).then((value) {
      context.read<CartCubit>().quantityItem = 1;
    });
  }
}
