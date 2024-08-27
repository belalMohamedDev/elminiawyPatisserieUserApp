import 'package:elminiawy/feature/changePassword/data/model/request/change_my_password_request.dart';
import 'package:elminiawy/feature/changePassword/data/model/response/change_my_password_response.dart';
import 'package:elminiawy/feature/changePassword/data/repository/change_password_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_my_password_state.dart';
part 'change_my_password_cubit.freezed.dart';

class ChangeMyPasswordCubit extends Cubit<ChangeMyPasswordState> {
  ChangeMyPasswordCubit(this._changeMyPasswordRepository) : super(const ChangeMyPasswordState.initial());
    final ChangeMyPasswordRepository _changeMyPasswordRepository;

  Future<void> submitPasswordChange() async {
    emit(const ChangeMyPasswordState.changeMyPasswordLoading());

    final response = await _changeMyPasswordRepository.changeMypasswordRepo(
        ChangeMyPasswordRequestBody(password: '', currentPassword: '', passwordConfirm: ''));

    response.when(
      success: (dataResponse) {
        emit(ChangeMyPasswordState.changeMyPasswordSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            ChangeMyPasswordState.changeMyPasswordError(
                errorMessage: error.message!, statesCode: error.statusCode!),
          );
        }
      },
    );
  }
}
