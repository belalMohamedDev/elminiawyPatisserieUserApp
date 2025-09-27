import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:intl/intl.dart';

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

  // Function to format
  String formatDate(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate);
    return DateFormat("hh:mm a").format(dateTime);
  }

  List<GetOrdersResponseData> getPendingOrders = [];

  Future<void> getAdminOrdersPendingSummit() async {
    if (isClosed) return;
    emit(const AdminHomeState.getPendingAdminOrdersLoading());

    final response = await _adminOrderRepositoryImplement
        .getAllOrderPendingToAdminRepository();

    if (isClosed) return;

    response.when(
      success: (response) {
        getPendingOrders = [];
        getPendingOrders = response.data ?? [];

        if (!isClosed) {
          emit(AdminHomeState.getPendingAdminOrdersSuccess(response));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(
            AdminHomeState.getPendingAdminOrdersError(error),
          );
        }
      },
    );
  }

  List<GetOrdersResponseData> getCompletedOrders = [];

  Future<void> getAdminOrdersCompletedSummit() async {
    emit(const AdminHomeState.getCompletedAdminOrdersLoading());
    if (isClosed) return;

    final response = await _adminOrderRepositoryImplement
        .getAllOrderCompleteToAdminRepository();
    if (isClosed) return;

    response.when(
      success: (response) {
        getCompletedOrders = [];
        getCompletedOrders = response.data ?? [];

        if (!isClosed) {
          emit(AdminHomeState.getCompletedAdminOrdersSuccess(response));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(
            AdminHomeState.getCompletedAdminOrdersError(error),
          );
        }
      },
    );
  }
}
