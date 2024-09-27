import 'package:json_annotation/json_annotation.dart';

part 'log_out_response.g.dart';

@JsonSerializable()
class LogOutResponse {
  bool? status;
  String? message;

  LogOutResponse({this.status, this.message});

  //from json
  factory LogOutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogOutResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$LogOutResponseToJson(this);
}
