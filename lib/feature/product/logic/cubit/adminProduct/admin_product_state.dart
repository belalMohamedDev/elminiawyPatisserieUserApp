part of 'admin_product_cubit.dart';

@freezed
class AdminProductState with _$AdminProductState {
  const factory AdminProductState.initial() = _Initial;


    const factory AdminProductState.selectedRangeState(RangeValues selectedRange) =
      SelectedRangeState;

  const factory AdminProductState.selectedOptionState(int selectedOption) =
      SelectedOptionState;

  const factory AdminProductState.getAllProductLoading() = GetAllProductLoading;

  const factory AdminProductState.getAllProductError(ApiErrorModel apiErrorModel) =
      GetAllProductError;

  const factory   AdminProductState.getAllProductSuccess(ProductResponse data) =
      GetAllProductSuccess;

  const factory AdminProductState.getAllProductSFromPaginationLoadingState() =
      AllProductSLoadingFromPagination;

  //get product State
  const factory AdminProductState.updateProductLoading() = UpdateProductLoading;
  const factory AdminProductState.updateProductError(ApiErrorModel apiErrorModel) =
      UpdateProductError;

  const factory AdminProductState.updateProductSuccess(
      List<DataProductResponse> data) = UpdateProductSuccess;
}
