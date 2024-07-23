import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/common/loading/loading_shimmer.dart';
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
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is GetProductSuccess) {
              return _newProductSuccessState(state, context);
            }
            return _newProductLoadingState();
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
        childAspectRatio: 0.6,
        children: List.generate(
            8,
            (index) => LoadingShimmer(
                  height: 280.h,
                  width: 153.375.w,
                  borderRadius: 12.r,
                )));
  }

  GridView _newProductSuccessState(
      GetProductSuccess state, BuildContext context) {
    return GridView.count(
        addAutomaticKeepAlives: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.6,
        children: List.generate(
          state.data.data!.length,
          (index) => Container(
            height: 280.h,
            width: 153.375.w,
            decoration: BoxDecoration(
              color: ColorManger.backgroundItem,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 105.w, top: 5.h),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(IconlyBroken.heart,
                            color: ColorManger.black26),
                      ),
                    ),
                    Image.asset(
                      ImageAsset.newItem,
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.h, left: 15.w),
                      child: CachedNetworkImage(
                        imageUrl: state.data.data![index].image!,
                        height: 120.h,
                        placeholder: (context, url) => LoadingShimmer(
                          height: 130.h,
                          width: 300.w,
                          borderRadius: 12.r,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 170.h, left: 90.w),
                      child: Container(
                        height: 20.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            color: ColorManger.brunLight,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 2.h),
                              child: Text(
                                  "${state.data.data![index].ratingsQuantity!}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 10.sp)),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Icon(
                              IconlyBroken.star,
                              color: ColorManger.white,
                              size: 10.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(state.data.data![index].title!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brun,
                          fontSize: 14.sp)),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: Text(" ${state.data.data![index].price!} \$",
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
