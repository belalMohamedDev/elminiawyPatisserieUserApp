part of 'coupons_cubit.dart';

@freezed
class CouponsState with _$CouponsState {
  const factory CouponsState.initial() = _Initial;

  const factory CouponsState.getAllCouponsSuccess(CouponsResponse data) =
      GetAllCouponsSuccess;

  const factory CouponsState.getAllCouponsLoading() = GetAllCouponsLoading;
  const factory CouponsState.getAllCouponsError(ApiErrorModel apiErrorModel) =
      GetAllCouponsError;

  const factory CouponsState.actionLoading() = ActionLoading;
  const factory CouponsState.actionSuccess() = ActionSuccess;
  const factory CouponsState.actionError(ApiErrorModel apiErrorModel) =
      ActionError;
}
