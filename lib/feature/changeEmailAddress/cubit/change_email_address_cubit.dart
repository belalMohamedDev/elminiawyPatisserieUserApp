import 'package:elminiawy/feature/changeEmailAddress/data/model/request/change_email_request.dart';
import 'package:elminiawy/feature/changeEmailAddress/data/repository/change_email_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/response/change_email_response.dart';

part 'change_email_address_state.dart';
part 'change_email_address_cubit.freezed.dart';

class ChangeEmailAddressCubit extends Cubit<ChangeEmailAddressState> {
  ChangeEmailAddressCubit(this._changeEmailAddressRepository)
      : super(const ChangeEmailAddressState.initial());

  final ChangeEmailAddressRepository _changeEmailAddressRepository;

  Future<void> submitEmailAddressChange() async {
    emit(const ChangeEmailAddressState.changeEmailAddressLoading());

    final response = await _changeEmailAddressRepository.changeMyEmailAddress(
        ChangeEmailRequestBody(newEmail: '', currentPassword: ''));

    response.when(
      success: (dataResponse) {
        emit(ChangeEmailAddressState.changeEmailAddressSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            ChangeEmailAddressState.changeEmailAddressError(
                errorMessage: error.message!, statesCode: error.statusCode!),
          );
        }
      },
    );
  }
}
