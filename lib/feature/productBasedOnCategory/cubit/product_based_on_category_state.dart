part of 'product_based_on_category_cubit.dart';

@freezed
class ProductBasedOnCategoryState with _$ProductBasedOnCategoryState {
  const factory ProductBasedOnCategoryState.initial() = _Initial;

    //get WishList State
  const factory ProductBasedOnCategoryState.getProductLoading() = GeProductLoading;
  const factory ProductBasedOnCategoryState.getProductError(
      {required int statesCode,
      required String errorMessage}) = GetProductError;

  const factory ProductBasedOnCategoryState.getProductSuccess(
      GetProductsBasedOnCategory data) =
      GetProductSuccess;
}
