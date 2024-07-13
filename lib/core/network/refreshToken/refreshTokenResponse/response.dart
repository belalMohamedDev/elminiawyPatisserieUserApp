import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class RefreshTokenResponse {
  bool? status;
  String? message;
  String? accessToken;


  RefreshTokenResponse({this.status, this.message, this.accessToken});

  //from json
  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}

