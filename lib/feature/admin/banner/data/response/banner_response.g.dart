// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) =>
    BannerResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$BannerResponseToJson(BannerResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataBannerResponse _$DataBannerResponseFromJson(Map<String, dynamic> json) =>
    DataBannerResponse(
      sId: json['_id'] as String?,
      image: json['image'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$DataBannerResponseToJson(DataBannerResponse instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'image': instance.image,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
