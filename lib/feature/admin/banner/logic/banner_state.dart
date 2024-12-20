part of 'banner_cubit.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState.initial() = _Initial;

    const factory BannerState.getBannersLoading() = GetBannersLoading;
  const factory BannerState.changeCrouserIndex(int index) = ChangeCrouserIndex;
  const factory BannerState.getBannersError(ApiErrorModel apiErrorModel) =
      GetBannersError;

  const factory BannerState.getBannersSuccess(List<DataBannerResponse> data) =
      GetBannersSuccess;


  const factory BannerState.setStartOrEndTextDate(String text) = SetStartOrEndTextDate;


    const factory BannerState.createBannersLoading() = CreateBannersLoading;
  const factory BannerState.createBannersError(ApiErrorModel apiErrorModel) =
      CreateBannersError;

  const factory BannerState.createBannersSuccess(List<DataBannerResponse> data) =
      CreateBannersSuccess;


  const factory BannerState.deleteBannersLoading(String id) = DeleteBannersLoading;

  const factory BannerState.deleteBannersError(ApiErrorModel apiErrorModel) =
     DeleteBannersError;

  const factory BannerState.deleteBannersSuccess(List<DataBannerResponse> data) =
      DeleteBannersSuccess;



  const factory BannerState.updateImageBannersLoading(String id) =
      UpdateImageBannersLoading;

  const factory BannerState.updateImageBannersError(ApiErrorModel apiErrorModel) =
      UpdateImageBannersError;

  const factory BannerState.updateImageBannersSuccess(
      List<DataBannerResponse> data) = UpdateImageBannersSuccess;


  const factory BannerState.updateBannersLoading(String id) =
      UpdateBannersLoading;

  const factory BannerState.updateBannersError(
      ApiErrorModel apiErrorModel) = UpdateBannersError;

  const factory BannerState.updateBannersSuccess(
      List<DataBannerResponse> data) = UpdateBannersSuccess;
}
