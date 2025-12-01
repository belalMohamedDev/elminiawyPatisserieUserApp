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
      )
      ..paginationRuslt = json['paginationRuslt'] == null
          ? null
          : PaginationRuslt.fromJson(
              json['paginationRuslt'] as Map<String, dynamic>,
            );

Map<String, dynamic> _$SubCategoryResponseToJson(
  SubCategoryResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'paginationRuslt': instance.paginationRuslt,
  'data': instance.data,
};

SubCategoryResponseData _$SubCategoryResponseDataFromJson(
  Map<String, dynamic> json,
) => SubCategoryResponseData(
  title: json['title'] as String?,
  sId: json['_id'] as String?,
  active: json['active'] as bool?,
  category: json['category'] == null
      ? null
      : CategoryDataToSubCategory.fromJson(
          json['category'] as Map<String, dynamic>,
        ),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$SubCategoryResponseDataToJson(
  SubCategoryResponseData instance,
) => <String, dynamic>{
  'title': instance.title,
  '_id': instance.sId,
  'active': instance.active,
  'category': instance.category,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'image': instance.image,
};

CategoryDataToSubCategory _$CategoryDataToSubCategoryFromJson(
  Map<String, dynamic> json,
) => CategoryDataToSubCategory(
  title: json['title'] as String?,
  sId: json['_id'] as String?,
);

Map<String, dynamic> _$CategoryDataToSubCategoryToJson(
  CategoryDataToSubCategory instance,
) => <String, dynamic>{'title': instance.title, '_id': instance.sId};
