import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/application/cubit/app_logic_cubit.dart';
import '../../../../core/common/loading/loading_shimmer.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../logic/categoryCubit/category_cubit.dart';

class CategoryListViewBuilder extends StatelessWidget {
  const CategoryListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Category",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.brun,
                    fontSize: 14.sp)),
            const Spacer(),
            GestureDetector(
              onTap: () {
          
                context
                    .read<AppLogicCubit>()
                    .bottomNavBarController
                    .jumpToTab(1);
              },
              child: Text("View all",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brunLight,
                      fontSize: 14.sp)),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is GetCategoriesSuccess) {
              return _categorySuccessState(state);
            }

            return _categoryLoadingAndErrorState();
          },
        ),
      ],
    );
  }

  SizedBox _categoryLoadingAndErrorState() {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Column(
              children: [
                LoadingShimmer(
                  height: 60.h,
                  width: 70.w,
                  borderRadius: 12.r,
                ),
                SizedBox(
                  height: 12.h,
                ),
                LoadingShimmer(
                  width: 40.w,
                  height: 10.h,
                  borderRadius: 12.r,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox _categorySuccessState(GetCategoriesSuccess state) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        addAutomaticKeepAlives: true,
        itemCount: state.data.data!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Column(
              children: [
                Container(
                  height: 60.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: ColorManger.backgroundItem),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: CachedNetworkImage(
                      imageUrl: state.data.data![index].image!,
                      placeholder: (context, url) => LoadingShimmer(
                        height: 90.h,
                        width: 90.w,
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
              ],
            ),
          );
        },
      ),
    );
  }
}
