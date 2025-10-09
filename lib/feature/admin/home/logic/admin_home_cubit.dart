import 'package:elminiawy/core/common/shared/shared_imports.dart';

import '../data/model/response/get_order_count_status.dart';
import '../data/repository/repo.dart';

part 'admin_home_state.dart';

part 'admin_home_cubit.freezed.dart';

class AdminHomeCubit extends Cubit<AdminHomeState> {
  AdminHomeCubit(this._adminOrderRepositoryImplement)
      : super(const AdminHomeState.initial());

  final OrderAdminRepositoryImplement _adminOrderRepositoryImplement;

  double xOffset = 0;
  double yOffset = 0;
  double rotate = 0.0;
  double scaleFactor = 1;
  bool drawerIsOpen = false;

  void drawerOpenOrClose(double xOffset, double yOffset, double scaleFactor,
      double rotate, bool drawerIsOpen) {
    this.xOffset = xOffset;
    this.yOffset = yOffset;
    this.scaleFactor = scaleFactor;
    this.rotate = rotate;
    this.drawerIsOpen = drawerIsOpen;

    emit(AdminHomeState.drawerState(
      xOffset: this.xOffset,
      yOffset: this.yOffset,
      scaleFactor: this.scaleFactor,
      rotate: this.rotate,
      drawerIsOpen: this.drawerIsOpen,
    ));
  }

  List<GetOrdersResponseData> getAdminOrders = [];

  Future<void> getAdminOrdersSummit(int status) async {
    if (isClosed) return;
    emit(const AdminHomeState.getAdminOrdersLoading());

    final response =
        await _adminOrderRepositoryImplement.getAllAdminOrderRepository(status);

    if (isClosed) return;

    response.when(
      success: (response) {
        getAdminOrders = [];
        getAdminOrders = response.data ?? [];

        if (!isClosed) {
          emit(AdminHomeState.getAdminOrdersSuccess(getAdminOrders));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(
            AdminHomeState.getAdminOrdersError(error),
          );
        }
      },
    );
  }

  Future<void> updateAdminOrderStatusSummit(
      {required String id,
      String? adminAcceptedAt,
      String? adminCompletedAt,
      String? canceledAt,
      required int status}) async {
    if (isClosed) return;
    emit(const AdminHomeState.updateAdminOrderStatusLoading());

    final response =
        await _adminOrderRepositoryImplement.updateAdminOrderStatusRepository(
            id: id,
            adminAcceptedAt: adminAcceptedAt,
            adminCompletedAt: adminCompletedAt,
            canceledAt: canceledAt,
            status: status);

    if (isClosed) return;

    response.when(
      success: (response) {
        final updatedIndex =
            getAdminOrders.indexWhere((order) => order.sId == id);

        if (updatedIndex != -1) {
          getAdminOrders.removeAt(updatedIndex);
        }

        if (!isClosed) {
          emit(AdminHomeState.updateAdminOrderStatusSuccess(getAdminOrders));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(
            AdminHomeState.updateAdminOrderStatusError(error),
          );
        }
      },
    );
  }

  GetOrderStatusCountResponse? getOrdersStatusAndSalesTodayCount;

  Future<void> getOrdersStatusAndSalesTodayCountSummit() async {
    if (isClosed) return;
    emit(const AdminHomeState.getOrdersStatusAndSalesTodayCountLoading());

    final response = await _adminOrderRepositoryImplement
        .getOrdersStatusAndSalesTodayCountRepository();

    if (isClosed) return;

    response.when(
      success: (response) {
        getOrdersStatusAndSalesTodayCount = response;

        if (!isClosed) {
          emit(AdminHomeState.getOrdersStatusAndSalesTodayCountSuccess(
              response));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(
            AdminHomeState.getOrdersStatusAndSalesTodayCountError(error),
          );
        }
      },
    );
  }
}
