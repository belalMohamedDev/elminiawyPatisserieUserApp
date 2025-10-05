// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_ruslt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationRuslt _$PaginationRusltFromJson(Map<String, dynamic> json) =>
    PaginationRuslt(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
      next: (json['next'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationRusltToJson(PaginationRuslt instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'limit': instance.limit,
      'numberOfPages': instance.numberOfPages,
      'next': instance.next,
    };
