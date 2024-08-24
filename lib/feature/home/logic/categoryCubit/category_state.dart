part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;

      //get category State
  const factory CategoryState.getCategoriesLoading() = GetCategoriesLoading;
  const factory CategoryState.getCategoriesError(
      {required int statesCode,
      required String errorMessage}) = GetCategoriesError;

  const factory CategoryState.getCategoriesSuccess(CategoryResponse data) =
      GetCategoriesSuccess;


}