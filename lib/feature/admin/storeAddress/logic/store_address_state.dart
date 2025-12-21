part of 'store_address_cubit.dart';

@freezed
class StoreAddressState with _$StoreAddressState {
  const factory StoreAddressState.initial() = _Initial;

  const factory StoreAddressState.getStoreAddressLoading() =
      GetStoreAddressLoading;
  const factory StoreAddressState.getStoreAddressError(
    ApiErrorModel apiErrorModel,
  ) = GetStoreAddressError;

  const factory StoreAddressState.getStoreAddressSuccess(
    BranchStoreAddressResponse data,
  ) = GetStoreAddressSuccess;

  const factory StoreAddressState.storeAddressLocationUpdated() =
      StoreAddressLocationUpdated;

  const factory StoreAddressState.storeAddressZoneUpdated() =
      StoreAddressZoneUpdated;

  const factory StoreAddressState.storeAddressError(String message) =
      StoreAddressError;

  const factory StoreAddressState.storeAddressSuccess() = StoreAddressSuccess;

  const factory StoreAddressState.storeAddressLoading() = StoreAddressLoading;
}
