// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_my_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMyPasswordResponse _$UpdateMyPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateMyPasswordResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      accessToken: json['accessToken'] as String?,
      data: json['data'] == null
          ? null
          : UpdateMyPasswordData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateMyPasswordResponseToJson(
        UpdateMyPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'accessToken': instance.accessToken,
      'data': instance.data,
    };

UpdateMyPasswordData _$UpdateMyPasswordDataFromJson(
        Map<String, dynamic> json) =>
    UpdateMyPasswordData(
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$UpdateMyPasswordDataToJson(
        UpdateMyPasswordData instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'refreshToken': instance.refreshToken,
    };
