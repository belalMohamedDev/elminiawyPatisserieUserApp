import 'package:json_annotation/json_annotation.dart';

part 'create_address_request.g.dart';

@JsonSerializable()
class CreateAddressRequestBody {
  CreateAddressRequestBody({
    required this.alias,
    required this.buildingName,
    required this.apartmentNumber,
    required this.floor,
    required this.region,
    required this.additionalDirections,
    required this.streetName,
    required this.phone,
    required this.addressLabel,
    required this.latitude,
    required this.longitude,
  });

  final String? alias;
  final String? buildingName;
  final String? apartmentNumber;
  final String? floor;
  final String? region;
  final String? additionalDirections;
  final String? streetName;
  final String? phone;
  final String? addressLabel;
  final String? latitude;
  final String? longitude;
  //from json
  factory CreateAddressRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressRequestBodyFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$CreateAddressRequestBodyToJson(this);
}
