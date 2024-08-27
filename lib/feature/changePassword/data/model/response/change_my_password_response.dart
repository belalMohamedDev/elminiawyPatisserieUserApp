import 'package:json_annotation/json_annotation.dart';
part 'change_my_password_response.g.dart';

@JsonSerializable()
class UpdateMyPasswordResponse {
  bool? status;
  String? message;
  String? accessToken;
  UpdateMyPasswordData? data;

 UpdateMyPasswordResponse(
      {this.status, this.message, this.accessToken, this.data});

  //from json
  factory UpdateMyPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateMyPasswordResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UpdateMyPasswordResponseToJson(this);
}


@JsonSerializable()
class UpdateMyPasswordData {
  String? sId;
  String? name;
  String? email;
  String? phone;
  String? refreshToken;

  UpdateMyPasswordData({this.sId, this.name, this.email, this.phone, this.refreshToken});

  //from json
  factory UpdateMyPasswordData.fromJson(Map<String, dynamic> json) =>
      _$UpdateMyPasswordDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UpdateMyPasswordDataToJson(this);
}
