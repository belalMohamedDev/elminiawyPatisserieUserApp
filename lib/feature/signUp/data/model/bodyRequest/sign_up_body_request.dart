import 'package:json_annotation/json_annotation.dart';
part 'sign_up_body_request.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  RegisterRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });
  final String name;

  final String email;

  final String password;

  final String phone;

  //from json
  factory RegisterRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestBodyFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
