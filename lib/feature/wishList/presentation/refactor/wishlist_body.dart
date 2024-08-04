import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/sharedWidget/product_grid_view_loading.dart';
import '../../../../core/common/sharedWidget/product_grid_view_success.dart';
import '../../../../core/common/toast/show_toast.dart';
import '../../cubit/wish_list_cubit.dart';

class WishListBody extends StatelessWidget {
  const WishListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListCubit, WishListState>(
      listener: (context, state) {
        state.whenOrNull(
          getWishListError: (statesCode, errorMessage) =>
              ShowToast.showToastErrorTop(
                  errorMessage: errorMessage, context: context),
        );
      },
      builder: (context, state) {
        if (state is GetWishListError || state is GetWishListLoading) {
          return const ProductGridViewLoadingState();
        }
        return ProductGridViewSuccessState(
          wishListData: context.read<WishListCubit>().dataList,
        );
      },
    );
  }
}
