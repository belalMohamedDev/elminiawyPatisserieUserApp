// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

CategoryResponseData _$CategoryResponseDataFromJson(
        Map<String, dynamic> json) =>
    CategoryResponseData(
      title: json['title'] as String?,
      sId: json['_id'] as String?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      image: json['image'] as String?,
      publicId: json['publicId'] as String?,
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$CategoryResponseDataToJson(
        CategoryResponseData instance) =>
    <String, dynamic>{
      'title': instance.title,
      '_id': instance.sId,
      'createdAt': instance.createdAt,
      'active': instance.active,
      'updatedAt': instance.updatedAt,
      'image': instance.image,
      'publicId': instance.publicId,
      'isLoading': instance.isLoading,
    };
