// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryResponse _$SubCategoryResponseFromJson(Map<String, dynamic> json) =>
    SubCategoryResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$SubCategoryResponseToJson(
        SubCategoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

SubCategoryResponseData _$SubCategoryResponseDataFromJson(
        Map<String, dynamic> json) =>
    SubCategoryResponseData(
      title: json['title'] as String?,
      sId: json['_id'] as String?,
      category: json['category'] == null
          ? null
          : CategoryDataToSubCategory.fromJson(
              json['category'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$SubCategoryResponseDataToJson(
        SubCategoryResponseData instance) =>
    <String, dynamic>{
      'title': instance.title,
      '_id': instance.sId,
      'category': instance.category,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

CategoryDataToSubCategory _$CategoryDataToSubCategoryFromJson(
        Map<String, dynamic> json) =>
    CategoryDataToSubCategory(
      title: json['title'] as String?,
      sId: json['_id'] as String?,
    );

Map<String, dynamic> _$CategoryDataToSubCategoryToJson(
        CategoryDataToSubCategory instance) =>
    <String, dynamic>{
      'title': instance.title,
      '_id': instance.sId,
    };
