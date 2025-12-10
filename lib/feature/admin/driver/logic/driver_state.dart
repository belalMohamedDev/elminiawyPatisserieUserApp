part of 'driver_cubit.dart';

@freezed
class DriverState with _$DriverState {
  const factory DriverState.initial() = _Initial;

  const factory DriverState.getAllDriverLoading() = GetAllDriverLoading;
  const factory DriverState.getAllDriverError(ApiErrorModel apiErrorModel) =
      GetAllDriverError;

  const factory DriverState.getAllDriverSuccess(AuthResponse data) =
      GetAllDriverSuccess;

  const factory DriverState.getAllActiveDriverLoading() =
      GetAllActiveDriverLoading;
  const factory DriverState.getAllActiveDriverError(
    ApiErrorModel apiErrorModel,
  ) = GetAllActiveDriverError;

  const factory DriverState.getAllActiveDriverSuccess(AuthResponse data) =
      GetAllActiveDriverSuccess;

  const factory DriverState.driverActivedLoading() = DriverActivedLoading;
  const factory DriverState.driverActivedError(ApiErrorModel apiErrorModel) =
      DriverActivedError;

  const factory DriverState.driverActivedSuccess(AuthResponse data) =
      GDriverActivedSuccess;

  const factory DriverState.deleteDriverLoading() = DeleteDriverLoading;
  const factory DriverState.deleteDriverError(ApiErrorModel apiErrorModel) =
      DeleteDriverError;

  const factory DriverState.deleteDriverSuccess(ApiSuccessGeneralModel data) =
      DeleteDriverSuccess;

  const factory DriverState.imagePicked() = DriverImagePicked;

  const factory DriverState.createNewDriverLoading() = CreateNewDriverLoading;
}
