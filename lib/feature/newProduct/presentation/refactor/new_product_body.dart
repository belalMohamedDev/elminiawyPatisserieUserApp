import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/sharedWidget/product_grid_view_loading.dart';
import '../../../../core/common/sharedWidget/product_grid_view_success.dart';
import '../../../../core/common/sharedWidget/search_row.dart';
import '../../Cubit/product_cubit.dart';

class NewProductBody extends StatelessWidget {
  const NewProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchRow(),
        SizedBox(
          height: 30.h,
        ),
        Expanded(
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is GetProductLoading || state is GetProductError) {
                return const ProductGridViewLoadingState();
              }

              return ProductGridViewSuccessState(
                dataList: context.read<ProductCubit>().dataList,
                grideViewIndex: 16,
              );
            },
          ),
        ),
      ],
    );
  }
}
