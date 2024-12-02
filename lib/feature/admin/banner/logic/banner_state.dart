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



  const factory BannerState.deleteBannersLoading(String id) = DeleteBannersLoading;

  const factory BannerState.deleteBannersError(ApiErrorModel apiErrorModel) =
     DeleteBannersError;

  const factory BannerState.deleteBannersSuccess(List<DataBannerResponse> data) =
      DeleteBannersSuccess;


}
