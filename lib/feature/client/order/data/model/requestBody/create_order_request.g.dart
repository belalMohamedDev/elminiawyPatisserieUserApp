// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderRequestBody _$CreateOrderRequestBodyFromJson(
  Map<String, dynamic> json,
) => CreateOrderRequestBody(
  shippingAddress: json['shippingAddress'] as String?,
  nearbyStoreAddress: json['nearbyStoreAddress'] as String?,
  notes: json['notes'] as String?,
  customerName: json['customerName'] as String?,
  customerPhone: json['customerPhone'] as String?,
  customerAddressText: json['customerAddressText'] as String?,
  orderSource: json['orderSource'] as String?,
  paidAmount: (json['paidAmount'] as num?)?.toDouble(),
  isDeferred: json['isDeferred'] as bool?,
);

Map<String, dynamic> _$CreateOrderRequestBodyToJson(
  CreateOrderRequestBody instance,
) => <String, dynamic>{
  'shippingAddress': ?instance.shippingAddress,
  'nearbyStoreAddress': ?instance.nearbyStoreAddress,
  'notes': ?instance.notes,
  'customerName': ?instance.customerName,
  'customerPhone': ?instance.customerPhone,
  'customerAddressText': ?instance.customerAddressText,
  'orderSource': ?instance.orderSource,
  'paidAmount': ?instance.paidAmount,
  'isDeferred': ?instance.isDeferred,
};
