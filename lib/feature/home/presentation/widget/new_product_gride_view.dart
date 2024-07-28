import 'package:elminiawy/core/utils/extensions.dart';
import 'package:elminiawy/feature/wishList/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/application/cubit/app_logic_cubit.dart';
import '../../../../core/common/sharedWidget/product_grid_view_loading.dart';
import '../../../../core/common/sharedWidget/product_grid_view_success.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../newProduct/Cubit/product_cubit.dart';

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
            InkWell(
              onTap: () {
                context.pushNamed(Routes.newProduct);

                context.read<AppLogicCubit>().setHideNavigationBar(true);
              },
              child: Text("See all",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brunLight,
                      fontSize: 14.sp)),
            ),
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
            if (state is GetProductLoading || state is GetProductError) {
              return const ProductGridViewLoadingState(
                physics: NeverScrollableScrollPhysics(),
              );
            }

            return ProductGridViewSuccessState(
              dataList: context.read<ProductCubit>().dataList,
              grideViewIndex: 4,
              physics: const NeverScrollableScrollPhysics(),
            );
          },
        )
      ],
    );
  }
}
