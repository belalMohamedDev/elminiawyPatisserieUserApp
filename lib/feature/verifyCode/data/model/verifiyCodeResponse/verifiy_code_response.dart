import 'package:json_annotation/json_annotation.dart';
part 'verifiy_code_response.g.dart';

@JsonSerializable()
class VerifyCodeResponse {
  bool? status;
  String? message;

  VerifyCodeResponse({this.status, this.message});

  //from json
  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$VerifyCodeResponseToJson(this);
}
