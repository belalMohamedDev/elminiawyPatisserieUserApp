part of 'sub_categories_cubit.dart';

@freezed
class SubCategoriesState with _$SubCategoriesState {
  const factory SubCategoriesState.initial() = _Initial;

  const factory SubCategoriesState.getSubCategoriesLoading() =
      GetSubCategoriesLoading;
  const factory SubCategoriesState.getSubCategoriesError(
      ApiErrorModel apiErrorModel) = GetSubCategoriesError;

  const factory SubCategoriesState.getSubCategoriesSuccess(
      List<SubCategoryResponseData> data) = GetSubCategoriesSuccess;

  const factory SubCategoriesState.deleteSubCategoriesLoading(String id) =
      DeleteSubCategoriesLoading;
  const factory SubCategoriesState.deleteSubCategoriesError(
      ApiErrorModel apiErrorModel) = DeleteSubCategoriesError;

  const factory SubCategoriesState.deleteSubCategoriesSuccess(
      List<SubCategoryResponseData> data) = DeleteSubCategoriesSuccess;
}
