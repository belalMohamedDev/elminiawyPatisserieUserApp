part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
    //add  product to Cart State
  const factory CartState.addItemToCartLoading() =
      AddItemToCartLoading;
  const factory CartState.addItemToCartError(
      {required int statesCode,
      required String errorMessage}) = AddItemToCartError;

  const factory CartState.addItemToCartSuccess(
      AddItemToCartResponse data) = AddItemToCartSuccess;

      
  const factory CartState.updateQuantityNumber(int quantity) =
      UpdateQuantityNumber;
}
