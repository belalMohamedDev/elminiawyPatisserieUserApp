part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;

  //get product State
  const factory ProductState.getNewProductLoading() = GetNewProductLoading;
  const factory ProductState.getNewProductError(ApiErrorModel apiErrorModel) =
      GetNewProductError;

  const factory ProductState.getNewProductSuccess(ProductResponse data) =
      GetNewProductSuccess;

  const factory ProductState.addNewProductItemToList(
      List<DataProductResponse> getFoundData) = AddNewProductItemToList;


}
