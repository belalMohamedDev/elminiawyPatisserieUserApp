// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_store_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStoreAddressResponse _$GetStoreAddressResponseFromJson(
        Map<String, dynamic> json) =>
    GetStoreAddressResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      paginationRuslt: json['paginationRuslt'] == null
          ? null
          : PaginationRuslt.fromJson(
              json['paginationRuslt'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetStoreAddressData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetStoreAddressResponseToJson(
        GetStoreAddressResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'paginationRuslt': instance.paginationRuslt,
      'data': instance.data,
    };

PaginationRuslt _$PaginationRusltFromJson(Map<String, dynamic> json) =>
    PaginationRuslt(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      skip: (json['skip'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationRusltToJson(PaginationRuslt instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'limit': instance.limit,
      'skip': instance.skip,
      'numberOfPages': instance.numberOfPages,
    };

GetStoreAddressData _$GetStoreAddressDataFromJson(Map<String, dynamic> json) =>
    GetStoreAddressData(
      location: json['location'] == null
          ? null
          : GetStoreAddressLocation.fromJson(
              json['location'] as Map<String, dynamic>),
      branchArea: json['branchArea'] as String?,
      briefness: json['briefness'] as String?,
      region: json['region'] as String?,
      sId: json['sId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$GetStoreAddressDataToJson(
        GetStoreAddressData instance) =>
    <String, dynamic>{
      'location': instance.location,
      'branchArea': instance.branchArea,
      'briefness': instance.briefness,
      'region': instance.region,
      'sId': instance.sId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

GetStoreAddressLocation _$GetStoreAddressLocationFromJson(
        Map<String, dynamic> json) =>
    GetStoreAddressLocation(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$GetStoreAddressLocationToJson(
        GetStoreAddressLocation instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
