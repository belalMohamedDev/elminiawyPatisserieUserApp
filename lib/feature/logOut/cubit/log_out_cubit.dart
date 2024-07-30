import 'package:elminiawy/feature/logOut/data/repository/log_out_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_out_state.dart';
part 'log_out_cubit.freezed.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit(this._logOutRepository) : super(const LogOutState.initial());
  final LogOutRepository _logOutRepository;

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
}
