import 'package:json_annotation/json_annotation.dart';
part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  bool? status;
  String? message;
  String? accessToken;
  @JsonKey(name: "data")
  dynamic data;

  AuthResponse({this.status, this.message, this.accessToken, this.data});

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
      this.driverActive,
      this.completeData});

  //from json
  factory DataAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$DataAuthResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$DataAuthResponseToJson(this);
}
