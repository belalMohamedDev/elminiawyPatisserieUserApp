import 'package:elminiawy/core/services/shared_pref_helper.dart';
import 'package:elminiawy/feature/login/data/model/loginResponse/login_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/services/app_storage.dart';
import '../../../core/services/app_storage_key.dart';
import '../../../core/style/fonts/strings_manger.dart';
import '../../../core/utils/app_regex.dart';
import '../data/model/bodyRequest/login_body_request.dart';
import '../data/repository/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController userLoginEmailAddress = TextEditingController();
  final TextEditingController userLoginPassword = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  final LoginRepository _loginRepository;
  final AppPreferences _appPreferences;
  bool showPass = true;
  bool isButtonInVaildator = false;

  LoginBloc(this._loginRepository, this._appPreferences)
      : super(const _Initial()) {
    on<UserLoginButton>(loginButton);
    on<LoginEvent>((event, emit) {
      if (event is UserLoginEmailAddress) {
        loginButtonVaildator(event, emit);

        if (!AppRegex.isEmailValid(event.value)) {
          emit(const LoginState.userLoginEmailAddress(
              AppStrings.pleaseEnterValidEmail));
        } else {
          emit(const LoginState.userLoginEmailAddress(""));
        }
      }

      if (event is UserLoginPassword) {
        loginButtonVaildator(event, emit);
        if (!AppRegex.isPasswordValid(event.value)) {
          emit(const LoginState.userLoginPassword(
              AppStrings.pleaseEnterValidPassword));
        }
      }

      if (event is UserShowLoginPassword) {
        showPass = !showPass;

        emit(
          LoginState.showUserPassword(showPass),
        );
      }
    });
  }

  ///////////////////////////////////
  //////////////////
  //////////////////////////////////

  Future<void> loginButtonVaildator(
      LoginEvent event, Emitter<LoginState> emit) async {
    if (!AppRegex.isPasswordValid(userLoginPassword.text) ||
        !AppRegex.isEmailValid(userLoginEmailAddress.text)) {
      isButtonInVaildator = false;
      emit(LoginState.buttonLoginVaildation(isButtonInVaildator));
    } else {
      isButtonInVaildator = true;
      emit(LoginState.buttonLoginVaildation(isButtonInVaildator));
    }
  }

/////////////////////////////////////////
//////////////////
//////////////////////////////
  Future<void> loginButton(LoginEvent event, Emitter<LoginState> emit) async {
    await event.whenOrNull(
      userLoginButton: () async {
        emit(
          const LoginState.loading(),
        );

        final response = await _loginRepository.login(
          LoginRequestBody(
            email: userLoginEmailAddress.text.trim(),
            password: userLoginPassword.text.trim(),
          ),
        );

        response.when(
          success: (loginResponse) async {
            await saveUserToken(
                loginResponse.accessToken!, loginResponse.data!.refreshToken!);
            emit(LoginState.suceess(loginResponse));
          },
          failure: (error) {
            emit(
              LoginState.error(
                  errorMessage: error.message!, statesCode: error.statusCode!),
            );
          },
        );
      },
    );
  }

  Future<void> saveUserToken(String accessToken, String refreshToken) async {
    await SharedPrefHelper.setSecuredString(PrefKeys.accessToken, accessToken);
    await SharedPrefHelper.setSecuredString(
        PrefKeys.refreshToken, refreshToken);
  }
}
