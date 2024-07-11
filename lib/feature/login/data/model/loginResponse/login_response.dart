
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse  {
  bool? status;
  String? message;
  String? token;
  DataLoginResponse ? data;

  LoginResponse ({this.status, this.message, this.token, this.data});


  
    //from json
    factory LoginResponse .fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);


  //to json
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

 
}


@JsonSerializable()
class DataLoginResponse  {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? role;
  bool? active;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  DataLoginResponse (
      {this.name,
      this.email,
      this.password,
      this.phone,
      this.role,
      this.active,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});



      
    //from json
    factory DataLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$DataLoginResponseFromJson(json);


  //to json
  Map<String, dynamic> toJson() => _$DataLoginResponseToJson(this);


  
}