part of 'admins_cubit.dart';

@freezed
class AdminsState with _$AdminsState {
  const factory AdminsState.initial() = _Initial;

  const factory AdminsState.getActiveAdminsLoading() = GetActiveAdminsLoading;
  const factory AdminsState.getActiveAdminsError(ApiErrorModel apiErrorModel) =
      GetActiveAdminsError;

  const factory AdminsState.getActiveAdminsSuccess(AuthResponse data) =
      GetActiveAdminsSuccess;

  const factory AdminsState.getInActiveAdminsLoading() =
      GetInActiveAdminsLoading;
  const factory AdminsState.getInActiveAdminsError(
    ApiErrorModel apiErrorModel,
  ) = GetInActiveAdminsError;

  const factory AdminsState.getInActiveAdminsSuccess(AuthResponse data) =
      GetInActiveAdminsSuccess;

  const factory AdminsState.imagePicked() = AdminsImagePicked;

  const factory AdminsState.createNewAdminLoading() = CreateNewAdminLoading;

}
