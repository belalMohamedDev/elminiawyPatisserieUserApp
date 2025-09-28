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

  const factory AdminHomeState.getAdminOrdersLoading() = GetAdminOrdersLoading;

  const factory AdminHomeState.getAdminOrdersError(
      ApiErrorModel apiErrorModel) = GetAdminOrdersError;

  const factory AdminHomeState.getAdminOrdersSuccess(
      GetOrdersResponse getOrdersResponse) = GetAdminOrdersSuccess;

  const factory AdminHomeState.getOrdersStatusAndSalesTodayCountLoading() =
      GetOrdersStatusAndSalesTodayCountLoading;

  const factory AdminHomeState.getOrdersStatusAndSalesTodayCountError(
      ApiErrorModel apiErrorModel) = GetOrdersStatusAndSalesTodayCountError;

  const factory AdminHomeState.getOrdersStatusAndSalesTodayCountSuccess(
          GetOrderStatusCountResponse getOrderStatusCountResponse) =
      GetOrdersStatusAndSalesTodayCountSuccess;
}
