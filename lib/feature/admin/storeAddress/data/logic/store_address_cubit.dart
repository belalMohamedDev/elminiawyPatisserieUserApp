import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/storeAddress/data/model/store_address_response.dart';
import 'package:elminiawy/feature/admin/storeAddress/data/repository/store_address_repo.dart';

part 'store_address_state.dart';
part 'store_address_cubit.freezed.dart';

class StoreAddressCubit extends Cubit<StoreAddressState> {
  StoreAddressCubit(this._branchStoreAddressRepositoryImplement)
      : super(const StoreAddressState.initial());

  final BranchStoreAddressRepositoryImplement
      _branchStoreAddressRepositoryImplement;
  List<Data> _allStoreAddress = [];

  List<Data> get allStoreAddress => _allStoreAddress;

  Future<void> fetchStoreAddressDriver() async {
    emit(const StoreAddressState.getStoreAddressLoading());

    final response = await _branchStoreAddressRepositoryImplement
        .getAllBranchStoreAddreesRepo();

    response.when(
      success: (dataResponse) {
        _allStoreAddress = [];
        _allStoreAddress.addAll(dataResponse.data!);

        emit(StoreAddressState.getStoreAddressSuccess(dataResponse));
      },
      failure: (error) {
        emit(StoreAddressState.getStoreAddressError(error));
      },
    );
  }
}
