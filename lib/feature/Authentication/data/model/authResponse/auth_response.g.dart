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
      total: (json['total'] as num?)?.toInt(),
      active: (json['active'] as num?)?.toInt(),
      inactive: (json['inactive'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'accessToken': instance.accessToken,
      'total': instance.total,
      'active': instance.active,
      'inactive': instance.inactive,
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
      storeAddress: json['storeAddress'] == null
          ? null
          : UserStoreAddress.fromJson(
              json['storeAddress'] as Map<String, dynamic>),
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
      'storeAddress': instance.storeAddress,
      'image': instance.image,
      'driverActive': instance.driverActive,
      'completeData': instance.completeData,
    };

UserStoreAddress _$UserStoreAddressFromJson(Map<String, dynamic> json) =>
    UserStoreAddress(
      location: json['location'] == null
          ? null
          : UserStoreLocation.fromJson(
              json['location'] as Map<String, dynamic>),
      branchArea: json['branchArea'] == null
          ? null
          : UserStoreLocalization.fromJson(
              json['branchArea'] as Map<String, dynamic>),
      briefness: json['briefness'] == null
          ? null
          : UserStoreLocalization.fromJson(
              json['briefness'] as Map<String, dynamic>),
      region: json['region'] == null
          ? null
          : UserStoreLocalization.fromJson(
              json['region'] as Map<String, dynamic>),
      sId: json['_id'] as String?,
    );

Map<String, dynamic> _$UserStoreAddressToJson(UserStoreAddress instance) =>
    <String, dynamic>{
      'location': instance.location,
      'branchArea': instance.branchArea,
      'briefness': instance.briefness,
      'region': instance.region,
      '_id': instance.sId,
    };

UserStoreLocation _$UserStoreLocationFromJson(Map<String, dynamic> json) =>
    UserStoreLocation(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$UserStoreLocationToJson(UserStoreLocation instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

UserStoreLocalization _$UserStoreLocalizationFromJson(
        Map<String, dynamic> json) =>
    UserStoreLocalization(
      en: json['en'] as String?,
      ar: json['ar'] as String?,
    );

Map<String, dynamic> _$UserStoreLocalizationToJson(
        UserStoreLocalization instance) =>
    <String, dynamic>{
      'en': instance.en,
      'ar': instance.ar,
    };
