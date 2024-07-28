import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/application/cubit/app_logic_cubit.dart';
import '../../../../core/common/sharedWidget/product_grid_view_success.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../newProduct/Cubit/product_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Search Products",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft),
          onPressed: () {
            context.pop();
            context.read<ProductCubit>().clearSearch();

            context.read<AppLogicCubit>().setHideNavigationBar(false);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: const SearchScreenBody(),
      ),
    );
  }
}

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final getProduct = context.read<ProductCubit>();
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40.h,
                child: TextFormField(
                  onChanged: (value) => getProduct.addItemToList(value),
                  keyboardType: TextInputType.text,
                  controller: getProduct.search,
                  decoration: InputDecoration(
                      hintText: 'Find Your Patisserie',
                      prefixIcon: Icon(IconlyBroken.search,
                          size: 18.sp, color: ColorManger.brunLight),
                      hintStyle: TextStyle(color: ColorManger.brunLight),
                      fillColor: ColorManger.backgroundItem,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManger.backgroundItem,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(12.r, 12.r)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManger.backgroundItem,
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(12.r, 12.r)),
                      )),
                ),
              ),
            ),
            Container(
              height: 41.h,
              margin: EdgeInsets.only(left: 10.w, right: 5.w),
              decoration: BoxDecoration(
                color: ColorManger.backgroundItem,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: IconButton(
                icon: Icon(IconlyBroken.filter, color: ColorManger.brunLight),
                onPressed: () {},
              ),
            ),
          ],
        ),
        Expanded(
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is AddItemToList) {
                return Padding(
                  padding: EdgeInsets.only(top: 25.h, left: 5.w, right: 5.w),
                  child: ProductGridViewSuccessState(
                    dataList: state.getFoundData,
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        )
      ],
    );
  }
}
