import 'package:json_annotation/json_annotation.dart';
part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  bool? status;
  String? message;
  String? accessToken;

  int? total;
  int? active;
  int? inactive;

  @JsonKey(name: "data")
  dynamic data;

  AuthResponse(
      {this.status,
      this.message,
      this.accessToken,
      this.data,
      this.total,
      this.active,
      this.inactive});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final response = _$AuthResponseFromJson(json);

    if (json['data'] is List) {
      response.data = (json['data'] as List)
          .map((item) => DataAuthResponse.fromJson(item))
          .toList();
    } else if (json['data'] is Map<String, dynamic>) {
      response.data = DataAuthResponse.fromJson(json['data']);
    }

    return response;
  }

  // to json
  Map<String, dynamic> toJson() {
    final json = _$AuthResponseToJson(this);

    if (data is List<DataAuthResponse>) {
      json['data'] = (data as List<DataAuthResponse>)
          .map((item) => item.toJson())
          .toList();
    } else if (data is DataAuthResponse) {
      json['data'] = (data as DataAuthResponse).toJson();
    }

    return json;
  }
}

@JsonSerializable()
class DataAuthResponse {
  @JsonKey(name: "_id")
  String? sId;
  String? name;
  String? email;
  String? phone;
  String? refreshToken;
  String? role;
  UserStoreAddress? storeAddress;
  String? image;
  bool? driverActive;
  bool? completeData;

  DataAuthResponse(
      {this.sId,
      this.name,
      this.email,
      this.phone,
      this.refreshToken,
      this.role,
      this.image,
      this.storeAddress,
      this.driverActive,
      this.completeData});

  //from json
  factory DataAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$DataAuthResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$DataAuthResponseToJson(this);
}

@JsonSerializable()
class UserStoreAddress {
  UserStoreLocation? location;
  UserStoreLocalization? branchArea;
  UserStoreLocalization? briefness;
  UserStoreLocalization? region;
  @JsonKey(name: "_id")
  String? sId;

  UserStoreAddress(
      {this.location, this.branchArea, this.briefness, this.region, this.sId});

  //from json
  factory UserStoreAddress.fromJson(Map<String, dynamic> json) =>
      _$UserStoreAddressFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserStoreAddressToJson(this);
}

@JsonSerializable()
class UserStoreLocation {
  String? type;
  List<double>? coordinates;

  UserStoreLocation({this.type, this.coordinates});

  //from json
  factory UserStoreLocation.fromJson(Map<String, dynamic> json) =>
      _$UserStoreLocationFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserStoreLocationToJson(this);
}

@JsonSerializable()
class UserStoreLocalization {
  String? en;
  String? ar;

  UserStoreLocalization({this.en, this.ar});

  //from json
  factory UserStoreLocalization.fromJson(Map<String, dynamic> json) =>
      _$UserStoreLocalizationFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserStoreLocalizationToJson(this);
}
