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

  final branchAreaController = TextEditingController();
  final regionController = TextEditingController();
  final briefnessController = TextEditingController();

  int activeStores = 0;
  int deActiveStores = 0;

  Future<void> fetchStoreAddressDriver() async {
    emit(const StoreAddressState.getStoreAddressLoading());

    final response = await _branchStoreAddressRepositoryImplement
        .getAllBranchStoreAddreesRepo();

    response.when(
      success: (dataResponse) {
        _allStoreAddress = [];
        _allStoreAddress.addAll(dataResponse.data!);

        activeStores = _allStoreAddress
            .where((store) => store.active == true)
            .length;
        deActiveStores = _allStoreAddress
            .where((store) => store.active == false)
            .length;

        emit(StoreAddressState.getStoreAddressSuccess(dataResponse));
      },
      failure: (error) {
        emit(StoreAddressState.getStoreAddressError(error));
      },
    );
  }

  List<String?> get storeBranchArea =>
      _allStoreAddress.map((e) => e.branchArea).toList();

  String? returnStoreAreaId(String value) {
    try {
      return _allStoreAddress
          .firstWhere((item) => item.branchArea == value)
          .sId;
    } catch (e) {
      return null;
    }
  }

  LatLng? storeLocation;
  List<LatLng> deliveryZonePoints = [];

  void setLocation(LatLng location) {
    storeLocation = location;
    emit(StoreAddressState.storeAddressLocationUpdated());
  }

  void setDeliveryZone(List<LatLng> points) {
    deliveryZonePoints = points;
    emit(StoreAddressState.storeAddressZoneUpdated());
  }

  void saveStore() {
    if (storeLocation == null || deliveryZonePoints.length < 3) {
      emit(
        StoreAddressState.storeAddressError(
          "Please select location and delivery zone",
        ),
      );
      return;
    }

    final payload = {
      "BranchArea": branchAreaController.text.trim(),
      "region": regionController.text.trim(),
      "briefness": briefnessController.text.trim(),
      "location": {
        "type": "Point",
        "coordinates": [storeLocation!.longitude, storeLocation!.latitude],
      },
      "deliveryZone": {
        "type": "Polygon",
        "coordinates": [
          deliveryZonePoints.map((e) => [e.longitude, e.latitude]).toList(),
        ],
      },
    };

    print(payload);

    emit(StoreAddressState.storeAddressSuccess(payload));
  }

  @override
  Future<void> close() {
    branchAreaController.dispose();
    regionController.dispose();
    briefnessController.dispose();
    return super.close();
  }
}
