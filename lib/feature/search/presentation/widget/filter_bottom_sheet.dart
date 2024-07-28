import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../newProduct/Cubit/product_cubit.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final cubit = context.read<ProductCubit>();

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h),
          child: SizedBox(
            height: 500.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.w, bottom: 15.h),
                  child: Text(
                    "Sort By",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brun,
                          fontSize: 18.sp,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          buildListTile(
                            context,
                            'Name: A to Z',
                            1,
                            cubit.selectedOption,
                          ),
                          buildListTile(
                            context,
                            'Name: Z to A',
                            2,
                            cubit.selectedOption,
                          ),
                          buildListTile(
                            context,
                            'Price: Low to High',
                            3,
                            cubit.selectedOption,
                          ),
                          buildListTile(
                            context,
                            'Price: High to Low',
                            4,
                            cubit.selectedOption,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30.h, bottom: 15.h),
                        child: Text(
                          "Price Range",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontFamily: FontConsistent.fontFamilyAcme,
                                    color: ColorManger.brun,
                                    fontSize: 18.sp,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w, top: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'EGP ${cubit.selectedRange.start.toInt()}',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            Text(
                              'EGP ${cubit.selectedRange.end.toInt()}',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      RangeSlider(
                        values: cubit.selectedRange,
                        min: 0,
                        max: 2000,
                        activeColor: ColorManger.brun,
                        inactiveColor: ColorManger.brunLight,
                        labels: RangeLabels(
                          "${cubit.selectedRange.start.toInt()}",
                          "${cubit.selectedRange.end.toInt()}",
                        ),
                        onChanged: (value) {
                          context
                              .read<ProductCubit>()
                              .updateSelectedRange(value);
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.applyFilters();
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Apply Filter',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: ColorManger.white,
                                  fontSize: 14.sp,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget buildListTile(
    BuildContext context, String title, int value, int groupValue) {
  return SizedBox(
    height: 50.h,
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(fontSize: 14.sp),
      ),
      leading: Radio<int>(
        value: value,
        groupValue: groupValue,
        onChanged: (value) {
          context.read<ProductCubit>().updateSelectedOption(value!);
        },
      ),
    ),
  );
}
