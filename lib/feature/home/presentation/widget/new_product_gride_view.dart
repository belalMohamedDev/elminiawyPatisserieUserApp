import 'package:cached_network_image/cached_network_image.dart';
import 'package:elminiawy/feature/wishList/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/common/loading/loading_shimmer.dart';
import '../../../../core/common/toast/show_toast.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/images/asset_manger.dart';
import '../../logic/productCubit/product_cubit.dart';

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
            Text("See all",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.brunLight,
                    fontSize: 14.sp)),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
            state.whenOrNull(
              getProductSuccess: (data) {
                for (var element in data.data!) {
                  context
                      .read<WishListCubit>()
                      .favorites
                      .addAll({element.sId!: element.inWishlist!});
                }
              },
            );
          },
          builder: (context, state) {
            return BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is GetProductSuccess) {
                  return _newProductSuccessState(state, context);
                }
                return _newProductLoadingState();
              },
            );
          },
        )
      ],
    );
  }

  GridView _newProductLoadingState() {
    return GridView.count(
        addAutomaticKeepAlives: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.7,
        children: List.generate(
            8,
            (index) => LoadingShimmer(
                  height: 280.h,
                  width: 153.375.w,
                  borderRadius: 12.r,
                )));
  }

  GridView _newProductSuccessState(
      GetProductSuccess getProductSuccessState, BuildContext context) {
    return GridView.count(
        addAutomaticKeepAlives: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.7,
        children: List.generate(
          getProductSuccessState.data.data!.length,
          (index) => Container(
            decoration: BoxDecoration(
              color: ColorManger.backgroundItem,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 105.w, top: 5.h),
                      child: IconButton(
                        onPressed: () {
                          context
                              .read<WishListCubit>()
                              .addOrRemoveProductFromWish(getProductSuccessState
                                  .data.data![index].sId!);
                        },
                        icon: BlocConsumer<WishListCubit, WishListState>(
                          listener: (context, state) {
                            state.whenOrNull(
                              addOrRemoveProductFromWishListError:
                                  (statesCode, errorMessage) =>
                                      ShowToast.showToastErrorTop(
                                          errorMessage: errorMessage,
                                          context: context),
                            );
                          },
                          builder: (context, state) {
                            return Icon(
                                context.read<WishListCubit>().favorites[
                                        getProductSuccessState
                                            .data.data![index].sId]!
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
                      padding: EdgeInsets.only(top: 40.h, left: 20.w),
                      child: CachedNetworkImage(
                        imageUrl:
                            getProductSuccessState.data.data![index].image!,
                        height: 100.h,
                        width: 120.w,
                        placeholder: (context, url) => const LoadingShimmer(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(getProductSuccessState.data.data![index].title!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brun,
                          fontSize: 14.sp)),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: Text(
                      " ${getProductSuccessState.data.data![index].price!}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorManger.brunLight,
                          fontSize: 14.sp)),
                ),
              ],
            ),
          ),
        ));
  }
}
