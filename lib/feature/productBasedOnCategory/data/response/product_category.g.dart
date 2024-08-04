// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsBasedOnCategory _$GetProductsBasedOnCategoryFromJson(
        Map<String, dynamic> json) =>
    GetProductsBasedOnCategory(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      allProducts: (json['allProducts'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetProductsBasedOnCategoryToJson(
        GetProductsBasedOnCategory instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'allProducts': instance.allProducts,
      'data': instance.data,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      title: json['title'] as String?,
      description: json['description'] as String?,
      ratingsAverage: (json['ratingsAverage'] as num?)?.toInt(),
      sId: json['sId'] as String?,
      price: (json['price'] as num?)?.toInt(),
      subCategory: json['subCategory'] as String?,
      image: json['image'] as String?,
      publicId: json['publicId'] as String?,
      ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'ratingsAverage': instance.ratingsAverage,
      'sId': instance.sId,
      'price': instance.price,
      'subCategory': instance.subCategory,
      'image': instance.image,
      'publicId': instance.publicId,
      'ratingsQuantity': instance.ratingsQuantity,
      'category': instance.category,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String?,
      title: json['title'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'products': instance.products,
    };
