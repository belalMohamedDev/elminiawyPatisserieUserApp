part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.userLoginEmailAddress(String value) = UserLoginEmailAddressState;
  const factory LoginState.userLoginPassword(String value) = UserLoginPasswordState;
  const factory LoginState.showUserPassword(bool value) = ShowUserPasswordState;
  const factory LoginState.buttonLoginVaildation(bool value) = ButtonLoginVaildation;
  const factory LoginState.loading() = LoginButtonLoadingData;
  const factory LoginState.error({required int statesCode,required String errorMessage}) = LoginButtonErrorData;
  const factory LoginState.suceess(LoginResponse data) = LoginButtonSuccessData;
}
