part of 'user_address_cubit.dart';

@freezed
class UserAddressState with _$UserAddressState {
  const factory UserAddressState.initial() = _Initial;

  const factory UserAddressState.createNewAddressLoading() =
      CreateNewAddressLoading;

  const factory UserAddressState.createNewAddressError(
      {required int statesCode,
      required String errorMessage}) = CreateNewAddressError;

  const factory UserAddressState.updateAddressRegion(
      {required String message,
      required LatLng latLng,
      required List<MarkerData> markData}) = UpdateAddressRegion;

  const factory UserAddressState.createNewAddressSuccess(
      CreateAddressResponse data) = CreateNewAddressSuccess;

  const factory UserAddressState.getAllAddressLoading() = GetAllAddressLoading;

  const factory UserAddressState.getAllAddressError(
      {required int statesCode,
      required String errorMessage}) = GetAllAddressError;

  const factory UserAddressState.getAllAddressSuccess(GetAddressResponse data) =
      GetAllAddressSuccess;

  const factory UserAddressState.changeRegionAreaIndex(
      int index, String alias) = ChangeRegionAreaIndex;

  const factory UserAddressState.updateAddressLoading() = UpdateAddressLoading;

  const factory UserAddressState.updateAddressError(
      {required int statesCode,
      required String errorMessage}) = UpdateAddressError;

  const factory UserAddressState.updateAddressSuccess(
      CreateAddressResponse data) = UpdateAddressSuccess;

  const factory UserAddressState.removeAddressLoading() = RemoveAddressLoading;

  const factory UserAddressState.removeAddressError(
      {required int statesCode,
      required String errorMessage}) = RemoveAddressError;

  const factory UserAddressState.removeAddressSuccess(
      ApiSuccessGeneralModel data) = RemoveAddressSuccess;
}
