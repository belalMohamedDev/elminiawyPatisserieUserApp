// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      accessToken: json['accessToken'] as String?,
      data: json['data'] == null
          ? null
          : DataLoginResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'accessToken': instance.accessToken,
      'data': instance.data,
    };

DataLoginResponse _$DataLoginResponseFromJson(Map<String, dynamic> json) =>
    DataLoginResponse(
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$DataLoginResponseToJson(DataLoginResponse instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'refreshToken': instance.refreshToken,
    };
