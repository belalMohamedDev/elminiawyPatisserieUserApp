
import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'create_address_response.g.dart';

@JsonSerializable()
class CreateAddressResponse {
  bool? status;
  String? message;
  CreateAddressData? data;

  CreateAddressResponse({this.status, this.message, this.data});

  //from json
  factory CreateAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$CreateAddressResponseToJson(this);
}

@JsonSerializable()
class CreateAddressData {
  String? alias;
  String? buildingName;
  String? apartmentNumber;
  String? floor;
  String? region;
  String? additionalDirections;
  String? streetName;
  String? phone;
  String? addressLabel;
  LocationData? location;
  String? user;
  String? nearbyStoreAddress;
  @JsonKey(name: "_id")
  String? sId;

  CreateAddressData({
    this.alias,
    this.buildingName,
    this.apartmentNumber,
    this.floor,
    this.region,
    this.additionalDirections,
    this.streetName,
    this.phone,
    this.addressLabel,
    this.location,
    this.user,
    this.nearbyStoreAddress,
    this.sId,
  });

  //from json
  factory CreateAddressData.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$CreateAddressDataToJson(this);
}

@JsonSerializable()
class LocationData {
  String? type;
  List<double>? coordinates;

  LocationData({this.type, this.coordinates});

  //from json
  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$LocationDataToJson(this);
}
