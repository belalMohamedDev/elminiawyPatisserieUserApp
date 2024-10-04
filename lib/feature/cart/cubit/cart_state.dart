part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  //add  product to Cart State
  const factory CartState.addItemToCartLoading(String id) = AddItemToCartLoading;

  const factory CartState.addItemToCartSuccess(
      CartResponse data, int quantity) = AddItemToCartSuccess;

  const factory CartState.updateQuantityNumber(int quantity) =
      UpdateQuantityNumber;

  //get Cart  item State
  const factory CartState.getCartItemLoading() = GetCartItemLoading;
    const factory CartState.getCartItemError(
      {required int statesCode,
      required String errorMessage}) = GetCartItemError;

  const factory CartState.getCartItemSuccess(
    CartResponse? data,
  ) = GetCartItemSuccess;

  //delete item from Cart  State

  const factory CartState.deleteCartItemError(
      {required int statesCode,
      required String errorMessage}) = DeleteCartItemError;
  const factory CartState.deleteCartItemLoading() = DeleteCartItemLoading;
  const factory CartState.deleteCartLoading() = DeleteCartLoading;

  const factory CartState.applyCouponLoading() = ApplyCouponLoading;

  const factory CartState.updateQuantityItemLoading(String id, int quantity) =
      UpdateQuantityItemLoading;
}
