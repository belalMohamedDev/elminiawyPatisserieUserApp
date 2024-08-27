part of 'change_my_password_cubit.dart';

@freezed
class ChangeMyPasswordState with _$ChangeMyPasswordState {
  const factory ChangeMyPasswordState.initial() = _Initial;

      const factory ChangeMyPasswordState.changeMyPasswordLoading() =
      ChangeMyPasswordLoading;
  const factory ChangeMyPasswordState.changeMyPasswordError(
      {required int statesCode,
      required String errorMessage}) = ChangeMyPasswordError;

  const factory ChangeMyPasswordState.changeMyPasswordSuccess(
      UpdateMyPasswordResponse data) = ChangeMyPasswordSuccess;

}
