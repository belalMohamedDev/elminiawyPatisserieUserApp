part of 'home_cubit.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;
  //get Banner State
  const factory HomeState.getBannersLoading() = GetBannersLoading;
  const factory HomeState.getBannersError(
      {required int statesCode,
      required String errorMessage}) = GetBannersError;

  const factory HomeState.getBannersSuccess(BannerResponse data) =GetBannersSuccess<T>;


    //get category State
  const factory HomeState.getCategoriesLoading() = GetCategoriesLoading;
  const factory HomeState.getCategoriesError(
      {required int statesCode,
      required String errorMessage}) = GetCategoriesError;

  const factory HomeState.getCategoriesSuccess(CategoryResponse data) =
      GetCategoriesSuccess<T>;
}
