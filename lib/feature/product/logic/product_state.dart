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

  const factory ProductState.selectedRangeState(RangeValues selectedRange) =
      SelectedRangeState;

  const factory ProductState.selectedOptionState(int selectedOption) =
      SelectedOptionState;

  const factory ProductState.getAllProductLoading() = GetAllProductLoading;
  const factory ProductState.getAllProductError(ApiErrorModel apiErrorModel) =
      GetAllProductError;

  const factory ProductState.getAllProductSuccess(ProductResponse data) =
      GetAllProductSuccess;
}
