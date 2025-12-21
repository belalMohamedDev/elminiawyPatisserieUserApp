import 'package:json_annotation/json_annotation.dart';

part 'create_store_address_request.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateStoreNewAddress {
  final String? latitude;
  final String? longitude;
  @JsonKey(name: "BranchArea")
  final BranchArea? branchArea;
  @JsonKey(name: "briefness")
  final BranchArea? briefness;
  @JsonKey(name: "region")
  final BranchArea? region;

  final List<List<double>>? deliveryZoneCoordinates;

  CreateStoreNewAddress({
    this.latitude,
    this.longitude,
    this.branchArea,
    this.briefness,
    this.region,
    this.deliveryZoneCoordinates,
  });

  factory CreateStoreNewAddress.fromJson(Map<String, dynamic> json) =>
      _$CreateStoreNewAddressFromJson(json);

  Map<String, dynamic> toJson() => _$CreateStoreNewAddressToJson(this);
}

@JsonSerializable()
class BranchArea {
  final String? en;
  final String? ar;

  BranchArea({this.en, this.ar});

  factory BranchArea.fromJson(Map<String, dynamic> json) =>
      _$BranchAreaFromJson(json);

  Map<String, dynamic> toJson() => _$BranchAreaToJson(this);
}
