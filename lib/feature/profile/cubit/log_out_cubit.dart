import 'package:elminiawy/core/utils/extensions.dart';
import 'package:elminiawy/feature/profile/data/repository/log_out_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/common/toast/show_toast.dart';
import '../../../core/routing/routes.dart';
import '../../../core/services/app_storage_key.dart';
import '../../../core/services/shared_pref_helper.dart';

part 'log_out_state.dart';
part 'log_out_cubit.freezed.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit(this._logOutRepository) : super(const LogOutState.initial());
  final LogOutRepository _logOutRepository;

  String initialUserName = 'Guest User';

  Future<void> getUserName() async {
    initialUserName =
        await SharedPrefHelper.getSecuredString(PrefKeys.userName) == ''
            ? 'Guest User'
            : await SharedPrefHelper.getSecuredString(PrefKeys.userName);

    emit(LogOutState.getStorageData(initialUserName));
  }

  Future<void> logOut(String refreshToken) async {
    emit(const LogOutState.logOutLoading());

    final response = await _logOutRepository.logOut(refreshToken);

    response.when(
      success: (response) {
        emit(LogOutState.logOutSuccess(successMessage: response.message!));
      },
      failure: (error) {
        emit(
          LogOutState.logOutError(
              errorMessage: error.message!, statesCode: error.statusCode!),
        );
      },
    );
  }

  void logInSnackBar(BuildContext context) {
    ShowToast.showToastErrorTop(
        errorMessage: 'You are not logged in ,please login to continue',
        context: context);
  }

  void checkTokenThenDoLogOut(BuildContext context) async {
    final userToken =
        await SharedPrefHelper.getSecuredString(PrefKeys.refreshToken);

    if (!userToken.isNullOrEmpty()) {
      await logOut(userToken);
    } else {
      if (context.mounted) {
        Navigator.of(context, rootNavigator: !false)
            .pushNamedAndRemoveUntil(Routes.loginRoute, (Route route) => false);
      }
    }
  }
}
