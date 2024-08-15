part of 'store_address_cuibt_cubit.dart';

@freezed
class StoreAddressCuibtState with _$StoreAddressCuibtState {
  const factory StoreAddressCuibtState.initial() = _Initial;


  const factory StoreAddressCuibtState.getAllStoreAddressLoading() = GetAllStoreAddressLoading;

  const factory StoreAddressCuibtState.getAllStoreAddressError(
      {required int statesCode,
      required String errorMessage}) = GetAllStoreAddressError;

  const factory StoreAddressCuibtState.getAllStoreAddressSuccess(
      GetStoreAddressResponse data) =
      GetAllStoreAddressSuccess;


}
