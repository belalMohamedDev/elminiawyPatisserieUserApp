part of 'store_address_cubit.dart';

@freezed
class StoreAddressState with _$StoreAddressState {
  const factory StoreAddressState.initial() = _Initial;


      const factory StoreAddressState.getStoreAddressLoading() = GetStoreAddressLoading;
  const factory StoreAddressState.getStoreAddressError(ApiErrorModel apiErrorModel) =
      GetStoreAddressError;

  const factory StoreAddressState.getStoreAddressSuccess(BranchStoreAddressResponse data) =
      GetStoreAddressSuccess;


}
