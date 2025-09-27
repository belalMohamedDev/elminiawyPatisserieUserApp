part of 'admin_home_cubit.dart';

@freezed
class AdminHomeState with _$AdminHomeState {
  const factory AdminHomeState.initial() = _Initial;
  const factory AdminHomeState.drawerState({
    required double xOffset,
    required double yOffset,
    required double rotate,
    required double scaleFactor,
    required bool drawerIsOpen,
  }) = _DrawerState;




  const factory AdminHomeState.getPendingAdminOrdersLoading() =
  GetPendingAdminOrdersLoading;


  const factory AdminHomeState.getPendingAdminOrdersError(
      ApiErrorModel apiErrorModel) = GetPendingAdminOrdersError;

  const factory AdminHomeState.getPendingAdminOrdersSuccess(
      GetOrdersResponse getOrdersResponse
      ) = GetPendingAdminOrdersSuccess;
}
