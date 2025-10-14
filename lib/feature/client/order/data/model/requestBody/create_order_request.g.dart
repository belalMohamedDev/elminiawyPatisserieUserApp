// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderRequestBody _$CreateOrderRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateOrderRequestBody(
      shippingAddress: json['shippingAddress'] as String?,
      nearbyStoreAddress: json['nearbyStoreAddress'] as String?,
      notes: json['notes'] as String?,
      customerName: json['customerName'] as String?,
      customerPhone: json['customerPhone'] as String?,
      customerAddressText: json['customerAddressText'] as String?,
      orderSource: json['orderSource'] as String?,
    );

Map<String, dynamic> _$CreateOrderRequestBodyToJson(
    CreateOrderRequestBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shippingAddress', instance.shippingAddress);
  writeNotNull('nearbyStoreAddress', instance.nearbyStoreAddress);
  writeNotNull('notes', instance.notes);
  writeNotNull('customerName', instance.customerName);
  writeNotNull('customerPhone', instance.customerPhone);
  writeNotNull('customerAddressText', instance.customerAddressText);
  writeNotNull('orderSource', instance.orderSource);
  return val;
}
