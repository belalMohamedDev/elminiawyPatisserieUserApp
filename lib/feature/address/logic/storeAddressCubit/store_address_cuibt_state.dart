part of 'store_address_cuibt_cubit.dart';

@freezed
class StoreAddressState with _$StoreAddressState {
  const factory StoreAddressState.initial() = _Initial;


  const factory StoreAddressState.getAllStoreAddressLoading() = GetAllStoreAddressLoading;

  const factory StoreAddressState.getAllStoreAddressError(
      {required int statesCode,
      required String errorMessage}) = GetAllStoreAddressError;

  const factory StoreAddressState.getAllStoreAddressSuccess(
      GetStoreAddressResponse data) =
      GetAllStoreAddressSuccess;


}
