part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;
  const factory LoginEvent.userLoginEmailAddress(String value) = UserLoginEmailAddress;
  const factory LoginEvent.userLoginPassword(String value) = UserLoginPassword;
  const factory LoginEvent.userShowLoginPassword() = UserShowLoginPassword;
  const factory LoginEvent.userLoginButton() = UserLoginButton;

}