// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderRequestBody _$CreateOrderRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateOrderRequestBody(
      shippingAddress: json['shippingAddress'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$CreateOrderRequestBodyToJson(
        CreateOrderRequestBody instance) =>
    <String, dynamic>{
      'shippingAddress': instance.shippingAddress,
      'notes': instance.notes,
    };
