part of 'driver_cubit.dart';

@freezed
class DriverState with _$DriverState {
  const factory DriverState.initial() = _Initial;

    const factory DriverState.getAllNotActiveDriverLoading() = GetAllNotActiveDriverLoading;
  const factory DriverState.getAllNotActiveDriverError(ApiErrorModel apiErrorModel) =
      GetAllNotActiveDriverError;

  const factory DriverState.getAllNotActiveDriverSuccess(AuthResponse data) =
      GetAllNotActiveDriverSuccess;



      
  const factory DriverState.getAllActiveDriverLoading() =
      GetAllActiveDriverLoading;
  const factory DriverState.getAllActiveDriverError(
      ApiErrorModel apiErrorModel) = GetAllActiveDriverError;

  const factory DriverState.getAllActiveDriverSuccess(AuthResponse data) =
      GetAllActiveDriverSuccess;
}
