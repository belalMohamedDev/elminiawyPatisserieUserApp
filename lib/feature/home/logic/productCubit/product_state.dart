part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
            //get product State
  const factory ProductState.getProductLoading() = GetProductLoading;
  const factory ProductState.getProductError(
      {required int statesCode,
      required String errorMessage}) = GetProductError;

  const factory ProductState.getProductSuccess(ProductResponse data) =
      GetProductSuccess;
}
