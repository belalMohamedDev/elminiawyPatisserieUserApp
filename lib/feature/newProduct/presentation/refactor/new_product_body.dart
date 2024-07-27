import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/sharedWidget/product_grid_view_loading.dart';
import '../../../../core/common/sharedWidget/product_grid_view_success.dart';
import '../../Cubit/product_cubit.dart';

class NewProductBody extends StatelessWidget {
  const NewProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is GetProductSuccess) {
          return ProductGridViewSuccessState(
            context: context,
            getProductSuccessState: state,
            grideViewIndex: 16,
          );
        }
        return const ProductGridViewLoadingState();
      },
    );
  }
}


