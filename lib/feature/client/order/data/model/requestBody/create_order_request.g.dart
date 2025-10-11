// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderRequestBody _$CreateOrderRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateOrderRequestBody(
      shippingAddress: json['shippingAddress'] as String?,
      nearbyStoreAddress: json['nearbyStoreAddress'] as String,
      notes: json['notes'] as String,
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
  val['nearbyStoreAddress'] = instance.nearbyStoreAddress;
  val['notes'] = instance.notes;
  return val;
}
