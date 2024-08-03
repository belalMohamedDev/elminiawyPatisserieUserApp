import 'package:elminiawy/feature/userAddress/data/model/response/get_address_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/success/api_success_general.dart';
import '../data/model/request/create_address_request.dart';
import '../data/model/response/create_address_response.dart';
import '../data/repository/address_repo.dart';

part 'user_address_state.dart';
part 'user_address_cubit.freezed.dart';

class UserAddressCubit extends Cubit<UserAddressState> {
  UserAddressCubit(this._userAddressRepository)
      : super(const UserAddressState.initial());

  final UserAddressRepository _userAddressRepository;

  Future<void> getUserAddress() async {
    emit(const UserAddressState.getAllAddressLoading());

    final response = await _userAddressRepository.getAllAddress();

    response.when(
      success: (dataResponse) {
        emit(UserAddressState.getAllAddressSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            UserAddressState.getAllAddressError(
                errorMessage: error.message!, statesCode: error.statusCode!),
          );
        }
      },
    );
  }

  Future<void> deleteUserAddress(String id) async {
    emit(const UserAddressState.removeAddressLoading());

    final response = await _userAddressRepository.removeAddress(id);

    response.when(
      success: (dataResponse) {
        emit(UserAddressState.removeAddressSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            UserAddressState.removeAddressError(
                errorMessage: error.message!, statesCode: error.statusCode!),
          );
        }
      },
    );
  }

  Future<void> addNewAddress() async {
    emit(const UserAddressState.createNewAddressLoading());

    final response =
        await _userAddressRepository.createANewAddress(CreateAddressRequestBody(
      additionalDirections: '',
      alias: '',
      buildingName: '',
      apartmentNumber: '',
      floor: '',
      region: '',
      streetName: '',
      phone: '',
      addressLabel: '',
      latitude: '',
      longitude: '',
    ));

    response.when(
      success: (dataResponse) {
        emit(UserAddressState.createNewAddressSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            UserAddressState.createNewAddressError(
                errorMessage: error.message!, statesCode: error.statusCode!),
          );
        }
      },
    );
  }

  Future<void> updateAddress(String id) async {
    emit(const UserAddressState.updateAddressLoading());

    final response = await _userAddressRepository.updateAddress(
        id,
        CreateAddressRequestBody(
          additionalDirections: '',
          alias: '',
          buildingName: '',
          apartmentNumber: '',
          floor: '',
          region: '',
          streetName: '',
          phone: '',
          addressLabel: '',
          latitude: '',
          longitude: '',
        ));

    response.when(
      success: (dataResponse) {
        emit(UserAddressState.updateAddressSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            UserAddressState.updateAddressError(
                errorMessage: error.message!, statesCode: error.statusCode!),
          );
        }
      },
    );
  }
}
