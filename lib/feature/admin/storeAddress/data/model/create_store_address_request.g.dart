// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_store_address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateStoreNewAddress _$CreateStoreNewAddressFromJson(
  Map<String, dynamic> json,
) => CreateStoreNewAddress(
  latitude: json['latitude'] as String?,
  longitude: json['longitude'] as String?,
  branchArea: json['BranchArea'] == null
      ? null
      : BranchArea.fromJson(json['BranchArea'] as Map<String, dynamic>),
  briefness: json['briefness'] == null
      ? null
      : BranchArea.fromJson(json['briefness'] as Map<String, dynamic>),
  region: json['region'] == null
      ? null
      : BranchArea.fromJson(json['region'] as Map<String, dynamic>),
  deliveryZoneCoordinates: (json['deliveryZoneCoordinates'] as List<dynamic>?)
      ?.map(
        (e) => (e as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
      )
      .toList(),
);

Map<String, dynamic> _$CreateStoreNewAddressToJson(
  CreateStoreNewAddress instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'BranchArea': instance.branchArea?.toJson(),
  'briefness': instance.briefness?.toJson(),
  'region': instance.region?.toJson(),
  'deliveryZoneCoordinates': instance.deliveryZoneCoordinates,
};

BranchArea _$BranchAreaFromJson(Map<String, dynamic> json) =>
    BranchArea(en: json['en'] as String?, ar: json['ar'] as String?);

Map<String, dynamic> _$BranchAreaToJson(BranchArea instance) =>
    <String, dynamic>{'en': instance.en, 'ar': instance.ar};
