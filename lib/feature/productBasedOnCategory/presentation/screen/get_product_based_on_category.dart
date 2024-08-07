import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/sharedWidget/search_row.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../cubit/product_based_on_category_cubit.dart';

class ProductBaseOnCategory extends StatefulWidget {
  const ProductBaseOnCategory(
      {super.key, required this.categoryId, required this.categoryName});

  final String categoryId;
  final String categoryName;

  @override
  State<ProductBaseOnCategory> createState() => _ProductBaseOnCategoryState();
}

class _ProductBaseOnCategoryState extends State<ProductBaseOnCategory> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        context
            .read<ProductBasedOnCategoryCubit>()
            .getProduct(widget.categoryId)
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.categoryName,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: const ProductBaseOnCategoryBody(),
    );
  }
}

class ProductBaseOnCategoryBody extends StatelessWidget {
  const ProductBaseOnCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
      child: Column(
        children: [
          const SearchRow(),
          SizedBox(
            height: 40.h,
          ),
          BlocBuilder<ProductBasedOnCategoryCubit, ProductBasedOnCategoryState>(
            builder: (context, state) {
              if (state is GetProductBasedOnCategorySuccess) {
                return _subCategorySuccessState(state);
              }
              return const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}

SizedBox _subCategorySuccessState(GetProductBasedOnCategorySuccess state) {
  return SizedBox(
    height: 40.h,
    child: ListView.builder(
      addAutomaticKeepAlives: true,
      itemCount: state.data.data!.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    index == 0
                        ? InkWell(
                            child: Container(
                              height: 35.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: ColorManger.brun),
                              child: Center(
                                child: Text("All",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontFamily:
                                                FontConsistent.fontFamilyAcme,
                                            color: Colors.white,
                                            fontSize: 13.sp)),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(
                      width: index == 0 ? 15.w : 0,
                    ),
                    Container(
                      height: 35.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: ColorManger.brownLight),
                      child: InkWell(
                        child: Center(
                          child: Text(state.data.data![index].title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontFamily: FontConsistent.fontFamilyAcme,
                                      color: ColorManger.brun,
                                      fontSize: 12.sp)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

