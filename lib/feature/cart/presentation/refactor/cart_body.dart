import 'package:elminiawy/feature/cart/presentation/screen/empty_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cart_cubit.dart';
import '../screen/cart_loading_screen.dart';
import '../screen/cart_success_screen.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is GetCartItemSuccess ||
            state is UpdateQuantityItemLoading ||
            state is AddItemToCartSuccess) {
          final cartData = context.read<CartCubit>().cartData;

          if (cartData == null || cartData.data!.cartItems!.isEmpty) {
            return const EmptyCartScreen();
          }

          return SuccessCartScreen(cartData: cartData);
        }
        return const LoadingCartScreen();
      },
    );
  }
}
