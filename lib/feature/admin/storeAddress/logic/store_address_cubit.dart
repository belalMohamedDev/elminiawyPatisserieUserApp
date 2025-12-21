import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/storeAddress/data/model/create_store_address_request.dart';
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

  final enBranchAreaController = TextEditingController();
  final arBranchAreaController = TextEditingController();
  final enRegionController = TextEditingController();
  final arRegionController = TextEditingController();
  final enBriefnessController = TextEditingController();
  final arBriefnessController = TextEditingController();

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

  void saveStore() async {
    if (storeLocation == null || deliveryZonePoints.length < 3) {
      emit(
        StoreAddressState.storeAddressError(
          "Please select location and delivery zone",
        ),
      );
      return;
    }

    List<List<double>> buildClosedPolygon(List<LatLng> points) {
      if (points.length < 3) {
        throw Exception("Polygon must have at least 3 points");
      }

      final polygon = points.map((e) => [e.latitude, e.longitude]).toList();

      final first = polygon.first;
      final last = polygon.last;

      if (first[0] != last[0] || first[1] != last[1]) {
        polygon.add(first);
      }

      return polygon;
    }

    emit(StoreAddressState.storeAddressLoading());

    final response = await _branchStoreAddressRepositoryImplement
        .createNewBranchStoreAddreesRepo(
          CreateStoreNewAddress(
            branchArea: BranchArea(
              en: enBranchAreaController.text.trim(),
              ar: arBranchAreaController.text.trim(),
            ),
            region: BranchArea(
              en: enRegionController.text.trim(),
              ar: arRegionController.text.trim(),
            ),
            briefness: BranchArea(
              en: enBriefnessController.text.trim(),
              ar: arBriefnessController.text.trim(),
            ),

            latitude: storeLocation!.latitude.toString(),
            longitude: storeLocation!.longitude.toString(),
            deliveryZoneCoordinates: buildClosedPolygon(deliveryZonePoints),
          ),
        );

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

        emit(StoreAddressState.storeAddressSuccess());
      },
      failure: (error) {
        print(error.message);
        emit(StoreAddressState.storeAddressError(error.message!));
      },
    );
  }

  @override
  Future<void> close() {
    enBranchAreaController.dispose();
    arBranchAreaController.dispose();
    enRegionController.dispose();
    arRegionController.dispose();
    enBriefnessController.dispose();
    arBriefnessController.dispose();
    return super.close();
  }
}
