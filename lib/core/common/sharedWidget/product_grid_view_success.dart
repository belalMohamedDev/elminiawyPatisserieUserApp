import 'package:cached_network_image/cached_network_image.dart';
import 'package:elminiawy/core/common/loading/loading_shimmer.dart';
import 'package:elminiawy/core/common/toast/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../feature/newProduct/model/response/product_response.dart';
import '../../../feature/wishList/cubit/wish_list_cubit.dart';
import '../../../feature/wishList/data/model/getWishListResponse/response.dart';
import '../../style/color/color_manger.dart';
import '../../style/fonts/font_manger.dart';
import '../../style/images/asset_manger.dart';

class ProductGridViewSuccessState extends StatelessWidget {
  final List<DataProductResponse>? dataList;
  final List<DataProductResponse>? searchList;
  final List<WishListProductData>? wishListData;

  final int? grideViewIndex;
  final ScrollPhysics? physics;

  const ProductGridViewSuccessState({
    super.key,
    this.dataList,
    this.searchList,
    this.grideViewIndex,
    this.physics,
    this.wishListData,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSearchActive = searchList != null;

    final List displayList =
        isSearchActive ? searchList! : (dataList ?? wishListData!);

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
          (index) => Container(
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
                return Icon(
                    context.read<WishListCubit>().favorites[product.sId]!
                        ? IconlyBold.heart
                        : IconlyBroken.heart,
                    color: ColorManger.brunLight);
              },
            ),
          ),
        ),
        Image.asset(
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
}
