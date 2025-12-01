part of 'sub_categories_cubit.dart';

@freezed
class SubCategoriesState with _$SubCategoriesState {
  const factory SubCategoriesState.initial() = _Initial;

  const factory SubCategoriesState.getSubCategoriesLoading() =
      GetSubCategoriesLoading;
 const factory SubCategoriesState.getSubCategoriesFromPaginationLoadingState() = SubCategoriesLoadingFromPagination;
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

  const factory SubCategoriesState.updateSubCategoriesLoading(String id) =
      UpdateSubCategoriesLoading;
  const factory SubCategoriesState.updateSubCategoriesError(
      ApiErrorModel apiErrorModel) = UpdateSubCategoriesError;

  const factory SubCategoriesState.updateSubCategoriesSuccess(
      List<SubCategoryResponseData> data) = UpdateSubCategoriesSuccess;


        const factory SubCategoriesState.updateSubCategoriesImageLoading(String id) =
      UpdateSubCategoriesImageLoading;
  const factory SubCategoriesState.updateSubCategoriesImageError(
      ApiErrorModel apiErrorModel) = UpdateSubCategoriesImageError;

  const factory SubCategoriesState.updateSubCategoriesImageSuccess(
      List<SubCategoryResponseData> data) = UpdateSubCategoriesImageSuccess;

      
  const factory SubCategoriesState.updateActiveStatus(
      bool? value) = UpdateActiveStatus;



        const factory SubCategoriesState.createSubCategoriesLoading( ) =
      CreateSubCategoriesLoading;
  const factory SubCategoriesState.createSubCategoriesError(
      ApiErrorModel apiErrorModel) = CreateSubCategoriesError;

  const factory SubCategoriesState.createSubCategoriesSuccess(
      List<SubCategoryResponseData> data) = CreateSubCategoriesSuccess;

}
