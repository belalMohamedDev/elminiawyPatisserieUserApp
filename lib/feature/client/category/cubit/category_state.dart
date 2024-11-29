part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;

  //get category State
  const factory CategoryState.getCategoriesLoading() = GetCategoriesLoading;
  const factory CategoryState.getCategoriesError(ApiErrorModel apiErrorModel) =
      GetCategoriesError;

  const factory CategoryState.getCategoriesSuccess(
      List<CategoryResponseData> data) = GetCategoriesSuccess;

  const factory CategoryState.updateCategoriesLoading(String id) =
      UpdateCategoriesLoading;
  const factory CategoryState.updateCategoriesError(
      ApiErrorModel apiErrorModel) = UpdateCategoriesError;

  const factory CategoryState.updateCategoriesSuccess(
      List<CategoryResponseData> data) = UpdateCategoriesSuccess;


  const factory CategoryState.createCategoriesLoading() =
      CreateCategoriesLoading;
}
