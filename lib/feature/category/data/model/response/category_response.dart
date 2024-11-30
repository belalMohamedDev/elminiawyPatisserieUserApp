import 'package:json_annotation/json_annotation.dart';
part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  bool? status;
  String? message;

  dynamic data;

  CategoryResponse({this.status, this.message, this.data});

  //from json

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    final response = _$CategoryResponseFromJson(json);

    if (json['data'] is List) {
      response.data = (json['data'] as List)
          .map((item) => CategoryResponseData.fromJson(item))
          .toList();
    } else if (json['data'] is Map<String, dynamic>) {
      response.data = CategoryResponseData.fromJson(json['data']);
    }

    return response;
  }

  // to json
  Map<String, dynamic> toJson() {
    final json = _$CategoryResponseToJson(this);

    if (data is List<CategoryResponseData>) {
      json['data'] = (data as List<CategoryResponseData>)
          .map((item) => item.toJson())
          .toList();
    } else if (data is CategoryResponseData) {
      json['data'] = (data as CategoryResponseData).toJson();
    }

    return json;
  }
}

@JsonSerializable()
class CategoryResponseData {
  String? title;
  @JsonKey(name: "_id")
  String? sId;
  String? createdAt;
  bool? active;
  String? updatedAt;
  String? image;
  String? publicId;
 

  CategoryResponseData(
      {this.title,
      this.sId,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.publicId,
     });

  //from json
  factory CategoryResponseData.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$CategoryResponseDataToJson(this);

}
