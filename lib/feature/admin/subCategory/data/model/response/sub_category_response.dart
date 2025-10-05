import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/core/network/paginationRuslt/pagination_ruslt_response.dart';

part 'sub_category_response.g.dart';

@JsonSerializable()
class SubCategoryResponse {
  bool? status;
  String? message;
  PaginationRuslt? paginationRuslt;
  dynamic data;

  SubCategoryResponse({this.status, this.message, this.data});

  //from json

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) {
    final response = _$SubCategoryResponseFromJson(json);

    if (json['data'] is List) {
      response.data = (json['data'] as List)
          .map((item) => SubCategoryResponseData.fromJson(item))
          .toList();
    } else if (json['data'] is Map<String, dynamic>) {
      response.data = SubCategoryResponseData.fromJson(json['data']);
    }

    return response;
  }

  // to json
  Map<String, dynamic> toJson() {
    final json = _$SubCategoryResponseToJson(this);

    if (data is List<SubCategoryResponseData>) {
      json['data'] = (data as List<SubCategoryResponseData>)
          .map((item) => item.toJson())
          .toList();
    } else if (data is SubCategoryResponseData) {
      json['data'] = (data as SubCategoryResponseData).toJson();
    }

    return json;
  }
}



@JsonSerializable()
class SubCategoryResponseData {
  String? title;
  @JsonKey(name: "_id")
  String? sId;
  bool? active;
  CategoryDataToSubCategory? category;
  String? createdAt;
  String? updatedAt;
  String? image;


  SubCategoryResponseData(
      {this.title,
      this.sId,
      this.active,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.image});

  factory SubCategoryResponseData.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryResponseDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$SubCategoryResponseDataToJson(this);
}

@JsonSerializable()
class CategoryDataToSubCategory {
  String? title;
  @JsonKey(name: "_id")
  String? sId;

  CategoryDataToSubCategory({this.title, this.sId});

  factory CategoryDataToSubCategory.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataToSubCategoryFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$CategoryDataToSubCategoryToJson(this);
}
