// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      accessToken: json['accessToken'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'accessToken': instance.accessToken,
      'data': instance.data,
    };

DataAuthResponse _$DataAuthResponseFromJson(Map<String, dynamic> json) =>
    DataAuthResponse(
      sId: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      refreshToken: json['refreshToken'] as String?,
      role: json['role'] as String?,
      image: json['image'] as String?,
      driverActive: json['driverActive'] as bool?,
      completeData: json['completeData'] as bool?,
    );

Map<String, dynamic> _$DataAuthResponseToJson(DataAuthResponse instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'refreshToken': instance.refreshToken,
      'role': instance.role,
      'image': instance.image,
      'driverActive': instance.driverActive,
      'completeData': instance.completeData,
    };
