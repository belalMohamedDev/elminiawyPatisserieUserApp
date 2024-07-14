import 'package:json_annotation/json_annotation.dart';
part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  bool? status;
  String? message;

  ForgetPasswordResponse({this.status, this.message});

  //from json
  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$ForgetPasswordResponseToJson(this);
}
