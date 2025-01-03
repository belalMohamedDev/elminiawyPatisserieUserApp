part of 'admins_cubit.dart';

@freezed
class AdminsState with _$AdminsState {
  const factory AdminsState.initial() = _Initial;

  
const factory AdminsState.getActiveAdminsLoading() = GetActiveAdminsLoading;
  const factory AdminsState.getActiveAdminsError(ApiErrorModel apiErrorModel) =
      GetActiveAdminsError;

  const factory AdminsState.getActiveAdminsSuccess(AuthResponse data) =
      GetActiveAdminsSuccess;
}
