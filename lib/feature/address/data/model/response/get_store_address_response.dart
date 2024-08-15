import 'package:json_annotation/json_annotation.dart';

part 'get_store_address_response.g.dart';

@JsonSerializable()
class GetStoreAddressResponse {
  bool? status;
  String? message;
  PaginationRuslt? paginationRuslt;
  List<GetStoreAddressData>? data;

  GetStoreAddressResponse(
      {this.status, this.message, this.paginationRuslt, this.data});

  //from json
  factory GetStoreAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStoreAddressResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$GetStoreAddressResponseToJson(this);
}

@JsonSerializable()
class PaginationRuslt {
  int? currentPage;
  int? limit;
  int? skip;
  int? numberOfPages;

  PaginationRuslt(
      {this.currentPage, this.limit, this.skip, this.numberOfPages});
  //from json
  factory PaginationRuslt.fromJson(Map<String, dynamic> json) =>
      _$PaginationRusltFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$PaginationRusltToJson(this);
}

@JsonSerializable()
class GetStoreAddressData {
  GetStoreAddressLocation? location;
  String? branchArea;
  String? briefness;
  String? region;
  String? sId;
  String? createdAt;
  String? updatedAt;

  GetStoreAddressData(
      {this.location,
      this.branchArea,
      this.briefness,
      this.region,
      this.sId,
      this.createdAt,
      this.updatedAt});
  //from json
  factory GetStoreAddressData.fromJson(Map<String, dynamic> json) =>
      _$GetStoreAddressDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$GetStoreAddressDataToJson(this);
}

@JsonSerializable()
class GetStoreAddressLocation {
  String? type;
  List<double>? coordinates;

  GetStoreAddressLocation({this.type, this.coordinates});
  //from json
  factory GetStoreAddressLocation.fromJson(Map<String, dynamic> json) =>
      _$GetStoreAddressLocationFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$GetStoreAddressLocationToJson(this);
}
