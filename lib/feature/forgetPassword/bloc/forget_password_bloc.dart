import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/services/app_storage_key.dart';
import '../../../core/services/shared_pref_helper.dart';
import '../../../core/style/fonts/strings_manger.dart';
import '../../../core/utils/app_regex.dart';
import '../../login/data/model/loginResponse/login_response.dart';
import '../../newPassword/data/model/bodyRequest/new_password_body_request.dart';
import '../../newPassword/data/repository/new_password_repo.dart';
import '../../verifyCode/data/model/bodyRequest/verifiy_code_body_request.dart';
import '../../verifyCode/data/model/verifiyCodeResponse/verifiy_code_response.dart';
import '../../verifyCode/data/repository/verify_code_repo.dart';
import '../data/model/bodyRequest/forget_password_body_request.dart';
import '../data/model/loginResponse/forget_password_response.dart';
import '../data/repository/forget_password_repo.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';
part 'forget_password_bloc.freezed.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final ForgetPasswordRepository _forgetPasswordRepository;
  final VerifyCodeRepository _verifyCodeRepository;
  final NewPasswordRepository _newPasswordRepository;
  String? code;
  bool showNewPassword = true;
  bool showConfirmNewPassword = true;
  bool isCreateNewPasswordButtonInVaildator = false;
  bool isVerifyCodeButtonVaildatorInVaildator = false;
  bool isContinueForgetPasswordButtonVaildatorInVaildator = false;

  final TextEditingController userForgetPasswordEmailAddress =
      TextEditingController();
  final TextEditingController userNewPassword = TextEditingController();
  final TextEditingController userConfirmNewPassword = TextEditingController();
  ForgetPasswordBloc(this._forgetPasswordRepository,
      this._newPasswordRepository, this._verifyCodeRepository)
      : super(const _Initial()) {
    on<UserForgetNewPasswordButtonEvent>(createNewPasswordButton);
    on<UserForgetPasswordVerifyButtonEvent>(verifyCodeButton);
    on<UserForgetPasswordButtonEvent>(forgetPasswordContinueButton);
    on<ForgetPasswordEvent>((event, emit) {
      event.whenOrNull(
        userShowForgetNewPassword: () {
          showNewPassword = !showNewPassword;
          emit(ForgetPasswordState.showNewPassword(showNewPassword));
        },
        userShowConfirmForgetNewPassword: () {
          showConfirmNewPassword = !showConfirmNewPassword;

          emit(
            ForgetPasswordState.showConfirmNewPassword(showConfirmNewPassword),
          );
        },
        userForgetPasswordEmailAddress: (value) {
          continueForgetPasswordButtonVaildator(event, emit);
          if (!AppRegex.isEmailValid(value)) {
            emit(const ForgetPasswordState.userForgetEmailAddress(
                AppStrings.pleaseEnterValidEmail));
          } else {
            emit(const ForgetPasswordState.userForgetEmailAddress(""));
          }
        },
        userForgetNewPassword: (value) {
          createNewPasswordButtonVaildator(event, emit);
          if (!AppRegex.isPasswordValid(value)) {
            emit(const ForgetPasswordState.userNewPassword(
                AppStrings.pleaseEnterValidSignUpPhoneNumber));
          }
        },
        userConfirmForgetNewPassword: (value) {
          createNewPasswordButtonVaildator(event, emit);

          if (value != userNewPassword.text) {
            emit(const ForgetPasswordState.userConfirmNewPassword(
                AppStrings.confirmPasswordNotEqualNewPassword));
          } else {
            emit(const ForgetPasswordState.userConfirmNewPassword(""));
          }
        },
        userForgetPasswordOTP: (value) {
          code = value;
          verifyCodeButtonVaildator(event, emit);
          emit(ForgetPasswordState.otpVerifyCode(code));
        },
      );
    });
  }

  // //////////////////////// forget password /////////////////////////
//   ///
// ////////////////////////////////////////////////////////////////////

  Future<void> continueForgetPasswordButtonVaildator(
      ForgetPasswordEvent event, Emitter<ForgetPasswordState> emit) async {
    if (!AppRegex.isEmailValid(userForgetPasswordEmailAddress.text)) {
      isContinueForgetPasswordButtonVaildatorInVaildator = false;

      emit(ForgetPasswordState.userForgetButtonValidator(
          isContinueForgetPasswordButtonVaildatorInVaildator));
    } else {
      isContinueForgetPasswordButtonVaildatorInVaildator = true;
      emit(ForgetPasswordState.userForgetButtonValidator(
          isContinueForgetPasswordButtonVaildatorInVaildator));
    }
  }

  Future<void> forgetPasswordContinueButton(
      ForgetPasswordEvent event, Emitter<ForgetPasswordState> emit) async {
    await event.whenOrNull(
      userForgetPasswordButton: () async {
        emit(
          const ForgetPasswordState.loading(),
        );

        final response = await _forgetPasswordRepository.forgetPassword(
          ForgetPasswordRequestBody(
            email: userForgetPasswordEmailAddress.text.trim(),
          ),
        );

        response.when(
          success: (forgetPasswordResponse) {
            emit(ForgetPasswordState.suceess(forgetPasswordResponse));
          },
          failure: (error) {
            emit(
              ForgetPasswordState.error(
                errorMessage: error.message ?? 'Unknown error',
                statesCode: error.statusCode ?? 500,
              ),
            );
          },
        );
      },
    );
  }

//   /////////////////// verify code ///////////////////////
//   ///
//   //////////////////////////////////////////////////////

  Future<void> verifyCodeButtonVaildator(
      ForgetPasswordEvent event, Emitter<ForgetPasswordState> emit) async {
    if (code!.isEmpty) {
      isVerifyCodeButtonVaildatorInVaildator = false;
      emit(ForgetPasswordState.verifyButtonValidator(
          isVerifyCodeButtonVaildatorInVaildator));
    } else {
      isVerifyCodeButtonVaildatorInVaildator = true;
      emit(ForgetPasswordState.verifyButtonValidator(
          isVerifyCodeButtonVaildatorInVaildator));
    }
  }

  Future<void> verifyCodeButton(
      ForgetPasswordEvent event, Emitter<ForgetPasswordState> emit) async {
    await event.whenOrNull(
      userForgetPasswordVerifyButton: () async {
        emit(
          const ForgetPasswordState.verifyCodeLoading(),
        );

        final response = await _verifyCodeRepository.verifyCode(
          VerifyCodeRequestBody(restCode: code!.trim()),
        );

        response.when(
          success: (verifyResponse) {
            emit(ForgetPasswordState.verifyCodeSuceess(verifyResponse));
          },
          failure: (error) {
            emit(
              ForgetPasswordState.verifyCodeError(
                  errorMessage: error.message!, statesCode: error.statusCode!),
            );
          },
        );
      },
    );
  }

// /////////////////////New password ////////////////////////
//   ///
// ///////////////////////////////////////////////////////////

  Future<void> createNewPasswordButtonVaildator(
      ForgetPasswordEvent event, Emitter<ForgetPasswordState> emit) async {
    if (!AppRegex.isPasswordValid(userNewPassword.text) ||
        !AppRegex.isPasswordValid(userConfirmNewPassword.text)) {
      isCreateNewPasswordButtonInVaildator = false;
      emit(ForgetPasswordState.createNewPasswordValidator(
          isCreateNewPasswordButtonInVaildator));
    } else {
      isCreateNewPasswordButtonInVaildator = true;
      emit(ForgetPasswordState.createNewPasswordValidator(
          isCreateNewPasswordButtonInVaildator));
    }
  }

  Future<void> createNewPasswordButton(
      ForgetPasswordEvent event, Emitter<ForgetPasswordState> emit) async {
    await event.whenOrNull(
      userForgetNewPasswordButton: () async {
        emit(
          const ForgetPasswordState.newPasswordLoading(),
        );

        final response = await _newPasswordRepository.newPassword(
          NewPasswordRequestBody(
              email: userForgetPasswordEmailAddress.text.trim(),
              newPassword: userNewPassword.text.trim(),
              passwordConfirm: userConfirmNewPassword.text.trim()),
        );

        response.when(
          success: (newPasswordResponse) async {
            emit(ForgetPasswordState.newPasswordSuceess(newPasswordResponse));
            await saveUserToken(newPasswordResponse.accessToken!,
                newPasswordResponse.data!.refreshToken!);
          },
          failure: (error) {
            emit(
              ForgetPasswordState.newPasswordError(
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
