import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/loading/loading_shimmer.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../home/logic/categoryCubit/category_cubit.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is GetCategoriesSuccess) {
          return _categorySuccessState(state, context);
        }

        return _categoryLoadingAndErrorState();
      },
    );
  }
}

Padding _categoryLoadingAndErrorState() {
  return Padding(
    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
    child: GridView.count(
        addAutomaticKeepAlives: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        childAspectRatio: 0.72,
        children: List.generate(
            10,
            (index) => Column(
                  children: [
                    LoadingShimmer(
                      height: 100.h,
                      width: 100.w,
                      borderRadius: 12.r,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    LoadingShimmer(
                      width: 50.w,
                      height: 10.h,
                      borderRadius: 12.r,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    LoadingShimmer(
                      width: 30.w,
                      height: 5.h,
                      borderRadius: 12.r,
                    ),
                  ],
                ))),
  );
}

Padding _categorySuccessState(
    GetCategoriesSuccess state, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
    child: GridView.count(
        addAutomaticKeepAlives: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        childAspectRatio: 0.6,
        children: List.generate(
            state.data.data!.length,
            (index) => Column(
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: ColorManger.backgroundItem),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: CachedNetworkImage(
                          imageUrl: state.data.data![index].image!,
                          placeholder: (context, url) => LoadingShimmer(
                            height: 100.h,
                            width: 100.w,
                            borderRadius: 10.r,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(state.data.data![index].title!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: FontConsistent.fontFamilyAcme,
                            color: Colors.black38,
                            fontSize: 12.sp)),
                    SizedBox(
                      height: 8.h,
                    ),
                    LoadingShimmer(
                      width: 40.w,
                      height: 5.h,
                      borderRadius: 12.r,
                    ),
                  ],
                ))),
  );
}
