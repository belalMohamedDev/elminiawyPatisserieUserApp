import '../../../../../core/common/shared/shared_imports.dart'; //

part 'user_address_state.dart';
part 'user_address_cubit.freezed.dart';

class UserAddressCubit extends Cubit<UserAddressState> {
  UserAddressCubit(this._userAddressRepository)
      : super(const UserAddressState.initial());

  final UserAddressRepositoryImplement _userAddressRepository;

  final TextEditingController buildingNameController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController additionalDirectionsContoller =
      TextEditingController();
  final TextEditingController phoneNumberContoller = TextEditingController();
  final TextEditingController addressLabel = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isPaymentAddress = false;

  List<GetAddressResponseData> addressDataList = [];

  int regionAreaIndex = 0;
  String aliasData = "Apartment";
  List<Map<String, dynamic>> regionArea = [
    {
      "imagePath": ImageAsset.building,
      "text": "Apartment",
    },
    {
      "imagePath": ImageAsset.home,
      "text": "House",
    },
    {
      "imagePath": ImageAsset.bag,
      "text": "Office",
    },
  ];

  void updateAddressAreaInformation(
      String newInfo, LatLng latLng, List<MarkerData> markData) {
    emit(UserAddressState.updateAddressRegion(
      message: newInfo,
      markData: markData,
      latLng: latLng,
    ));
  }

  void clearAllControllers() {
    buildingNameController.clear();
    companyController.clear();
    floorController.clear();
    streetController.clear();
    additionalDirectionsContoller.clear();
    phoneNumberContoller.clear();
    addressLabel.clear();
  }

  void changeRegionAreaIndex({required int index, required String alias}) {
    regionAreaIndex = index;
    aliasData = alias;

    emit(UserAddressState.changeRegionAreaIndex(regionAreaIndex, aliasData));
  }

  Future<void> getUserAddress() async {
    emit(const UserAddressState.getAllAddressLoading());

    final response = await _userAddressRepository.getAllAddress();

    response.when(
      success: (dataResponse) {
        if (dataResponse.data!.isNotEmpty) {
          addressDataList = [];
          addressDataList.addAll(dataResponse.data!);
        }
        emit(UserAddressState.getAllAddressSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            UserAddressState.getAllAddressError(
              error),
          );
        }
      },
    );
  }

  Future<void> deleteUserAddress(String addressId) async {
    emit(const UserAddressState.removeAddressLoading());

    final response = await _userAddressRepository.removeAddress(addressId);

    response.when(
      success: (dataResponse) {
        addressDataList.removeWhere((address) => address.sId == addressId);

        emit(UserAddressState.removeAddressSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            UserAddressState.removeAddressError(
               error),
          );
        }
      },
    );
  }

  Future<void> addNewAddress(
      {required String region,
      required String latitude,
      required String longitude}) async {
    emit(const UserAddressState.createNewAddressLoading());

    final createAddressRequestBody = CreateAddressRequestBody(
      additionalDirections: additionalDirectionsContoller.text.trim().isNotEmpty
          ? additionalDirectionsContoller.text.trim()
          : null,
      alias: aliasData.trim().isNotEmpty ? aliasData.trim() : null,
      buildingName: buildingNameController.text.trim().isNotEmpty
          ? buildingNameController.text.trim()
          : null,
      apartmentNumber: companyController.text.trim().isNotEmpty
          ? companyController.text.trim()
          : null,
      floor: floorController.text.trim().isNotEmpty
          ? floorController.text.trim()
          : null,
      region: region.trim().isNotEmpty ? region.trim() : null,
      streetName: streetController.text.trim().isNotEmpty
          ? streetController.text.trim()
          : null,
      phone: phoneNumberContoller.text.trim().isNotEmpty
          ? phoneNumberContoller.text.trim()
          : null,
      addressLabel:
          addressLabel.text.trim().isNotEmpty ? addressLabel.text.trim() : null,
      latitude: latitude.trim().isNotEmpty ? latitude.trim() : null,
      longitude: longitude.trim().isNotEmpty ? longitude.trim() : null,
    );

    final response = await _userAddressRepository
        .createANewAddress(createAddressRequestBody);

    response.when(
      success: (dataResponse) {
        if (dataResponse.data != null) {
          addressDataList.add(GetAddressResponseData(
            sId: dataResponse.data!.sId,
            alias: dataResponse.data!.alias,
            buildingName: dataResponse.data!.buildingName,
            apartmentNumber: dataResponse.data!.apartmentNumber,
            floor: dataResponse.data!.floor,
            region: dataResponse.data!.region,
            additionalDirections: dataResponse.data!.additionalDirections,
            streetName: dataResponse.data!.streetName,
            phone: dataResponse.data!.phone,
            addressLabel: dataResponse.data!.addressLabel,
            location: GetAddressResponseLocation(
              type: dataResponse.data!.location!.type,
              coordinates: dataResponse.data!.location!.coordinates,
            ),
          ));
        }

        emit(UserAddressState.createNewAddressSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            UserAddressState.createNewAddressError(
             error),
          );
        }
      },
    );
  }

  Future<void> updateAddress(
      {required String id,
      required String region,
      required String latitude,
      required String longitude}) async {
    emit(const UserAddressState.updateAddressLoading());
    final createAddressRequestBody = CreateAddressRequestBody(
      additionalDirections: additionalDirectionsContoller.text.trim().isNotEmpty
          ? additionalDirectionsContoller.text.trim()
          : null,
      alias: aliasData.trim().isNotEmpty ? aliasData.trim() : null,
      buildingName: buildingNameController.text.trim().isNotEmpty
          ? buildingNameController.text.trim()
          : null,
      apartmentNumber: companyController.text.trim().isNotEmpty
          ? companyController.text.trim()
          : null,
      floor: floorController.text.trim().isNotEmpty
          ? floorController.text.trim()
          : null,
      region: region.trim().isNotEmpty ? region.trim() : null,
      streetName: streetController.text.trim().isNotEmpty
          ? streetController.text.trim()
          : null,
      phone: phoneNumberContoller.text.trim().isNotEmpty
          ? phoneNumberContoller.text.trim()
          : null,
      addressLabel:
          addressLabel.text.trim().isNotEmpty ? addressLabel.text.trim() : null,
      latitude: latitude.trim().isNotEmpty ? latitude.trim() : null,
      longitude: longitude.trim().isNotEmpty ? longitude.trim() : null,
    );

    final response = await _userAddressRepository.updateAddress(
        id, createAddressRequestBody);

    response.when(
      success: (dataResponse) {
        addressDataList = addressDataList.map((address) {
          if (address.sId == id) {
            return GetAddressResponseData(
              sId: id,
              alias: dataResponse.data!.alias,
              buildingName: dataResponse.data!.buildingName,
              apartmentNumber: dataResponse.data!.apartmentNumber,
              floor: dataResponse.data!.floor,
              region: dataResponse.data!.region,
              additionalDirections: dataResponse.data!.additionalDirections,
              streetName: dataResponse.data!.streetName,
              phone: dataResponse.data!.phone,
              addressLabel: dataResponse.data!.addressLabel,
              location: GetAddressResponseLocation(
                type: dataResponse.data!.location!.type,
                coordinates: dataResponse.data!.location!.coordinates,
              ),
            );
          }
          return address;
        }).toList();

        emit(UserAddressState.updateAddressSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            UserAddressState.updateAddressError(
             error),
          );
        }
      },
    );
  }
}
