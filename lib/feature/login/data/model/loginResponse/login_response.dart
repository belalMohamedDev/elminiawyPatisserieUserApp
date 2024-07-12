import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  bool? status;
  String? message;
  String? accessToken;
  DataLoginResponse? data;

  LoginResponse({this.status, this.message, this.accessToken, this.data});

  //from json
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class DataLoginResponse {
  String? sId;
  String? name;
  String? email;
  String? phone;
  String? refreshToken;

  DataLoginResponse(
      {this.sId, this.name, this.email, this.phone, this.refreshToken});

  //from json
  factory DataLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$DataLoginResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$DataLoginResponseToJson(this);
}
