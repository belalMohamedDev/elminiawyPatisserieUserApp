import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/response/get_store_address_response.dart';
import '../../data/repository/store_address_repo.dart';

part 'store_address_cuibt_state.dart';
part 'store_address_cuibt_cubit.freezed.dart';

class StoreAddressCuibt extends Cubit<StoreAddressState> {
  StoreAddressCuibt(this._addressRepositoryImplement)
      : super(const StoreAddressState.initial());

  final StoreAddressRepositoryImplement _addressRepositoryImplement;
  List<GetStoreAddressData> addressDataList = [];

  Future<void> getAllStoreAddress() async {
    emit(const StoreAddressState.getAllStoreAddressLoading());

    final response = await _addressRepositoryImplement.getAllStoreAddress();

    response.when(success: (dataResponse) {
      if (dataResponse.data!.isNotEmpty) {
        addressDataList = [];
        addressDataList.addAll(dataResponse.data!);
      }
      emit(StoreAddressState.getAllStoreAddressSuccess(dataResponse));
    }, failure: (error) {
      if (error.statusCode != 401) {
        emit(
          StoreAddressState.getAllStoreAddressError(
              errorMessage: error.message!, statesCode: error.statusCode!),
        );
      }
    });
  }
}
