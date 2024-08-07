part of 'product_based_on_category_cubit.dart';

@freezed
class ProductBasedOnCategoryState with _$ProductBasedOnCategoryState {
  const factory ProductBasedOnCategoryState.initial() = _Initial;

    //get WishList State
  const factory ProductBasedOnCategoryState.getProductLoading() = GeProductBasedOnCategoryLoading;
  const factory ProductBasedOnCategoryState.getProductError(
      {required int statesCode,
      required String errorMessage}) = GetProductBasedOnCategoryError;

  const factory ProductBasedOnCategoryState.getProductSuccess(
      GetProductsBasedOnCategory data) =
      GetProductBasedOnCategorySuccess;
}
