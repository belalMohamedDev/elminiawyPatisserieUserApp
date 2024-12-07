// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataProductResponse _$DataProductResponseFromJson(Map<String, dynamic> json) =>
    DataProductResponse(
      title: json['title'] as String?,
      inCart: json['in_cart'] as bool?,
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      inWishlist: json['in_wishlist'] as bool?,
      description: json['description'] as String?,
      sId: json['_id'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      active: json['active'] as bool?,
      image: json['image'] as String?,
      publicId: json['publicId'] as String?,
      ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataProductResponseToJson(
        DataProductResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'ratingsAverage': instance.ratingsAverage,
      'active': instance.active,
      '_id': instance.sId,
      'price': instance.price,
      'image': instance.image,
      'publicId': instance.publicId,
      'ratingsQuantity': instance.ratingsQuantity,
      'in_cart': instance.inCart,
      'in_wishlist': instance.inWishlist,
    };
