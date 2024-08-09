import 'package:elminiawy/feature/cart/data/repository/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/bodyRequest/add_item.dart';
import '../data/model/response/add_item.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepositoryImplement) : super(const CartState.initial());
  final CartRepositoryImplement _cartRepositoryImplement;
  int quantityItem = 1;

  Future<void> addItemToCart(String productId) async {
    emit(const CartState.addItemToCartLoading());

    final response = await _cartRepositoryImplement.addItemToCart(
        AddItemToCartRequestBody(product: productId, quantity: quantityItem));

    response.when(
      success: (dataResponse) {
        emit(CartState.addItemToCartSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            CartState.addItemToCartError(
                errorMessage: error.message!, statesCode: error.statusCode!),
          );
        }
      },
    );
  }

  void increaseQuantity() {
    emit(CartState.updateQuantityNumber(quantityItem++));
  }

  void decreaseQuantity() {
    emit(CartState.updateQuantityNumber(quantityItem--));
  }
}
