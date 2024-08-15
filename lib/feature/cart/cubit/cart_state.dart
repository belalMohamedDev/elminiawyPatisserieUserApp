part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  //add  product to Cart State
  const factory CartState.addItemToCartLoading() = AddItemToCartLoading;
  const factory CartState.addItemToCartError(
      {required int statesCode,
      required String errorMessage}) = AddItemToCartError;

  const factory CartState.addItemToCartSuccess(AddItemToCartResponse data) =
      AddItemToCartSuccess;

  const factory CartState.updateQuantityNumber(int quantity) =
      UpdateQuantityNumber;

  //get Cart  item State
  const factory CartState.getCartItemLoading() = GetCartItemLoading;
  const factory CartState.getCartItemError(
      {required int statesCode,
      required String errorMessage}) = GetCartItemError;

  const factory CartState.getCartItemSuccess(
    GetCartResponse? data,
  ) = GetCartItemSuccess;

  //delete item from Cart  State

  const factory CartState.deleteCartItemError(
      {required int statesCode,
      required String errorMessage}) = DeleteCartItemError;

  const factory CartState.updateQuantityItemLoading(int quantity) =
      UpdateQuantityItemLoading;
}
