import '../../../../core/common/shared/shared_imports.dart'; //

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  bool? status;
  String? message;

  @JsonKey(name: "data")
  dynamic data;

  ProductResponse({this.status, this.message, this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    final response = _$ProductResponseFromJson(json);

    if (json['data'] is List) {
      response.data = (json['data'] as List)
          .map((item) => DataProductResponse.fromJson(item))
          .toList();
    } else if (json['data'] is Map<String, dynamic>) {
      response.data = DataProductResponse.fromJson(json['data']);
    }

    return response;
  }

  // to json
  Map<String, dynamic> toJson() {
    final json = _$ProductResponseToJson(this);

    if (data is List<DataProductResponse>) {
      json['data'] = (data as List<DataProductResponse>)
          .map((item) => item.toJson())
          .toList();
    } else if (data is DataProductResponse) {
      json['data'] = (data as DataProductResponse).toJson();
    }

    return json;
  }
}

@JsonSerializable()
class DataProductResponse {
  String? title;
  String? description;
  double? ratingsAverage;
  bool? active;
  @JsonKey(name: "_id")
  String? sId;
  double? price;
  //String? subCategory;
  String? image;
  String? publicId;
  int? ratingsQuantity;
  // String? category;
  @JsonKey(name: "in_cart")
  bool? inCart;
  @JsonKey(name: "in_wishlist")
  bool? inWishlist;

  DataProductResponse({
    this.title,
    this.inCart,
    this.ratingsAverage,
    this.inWishlist,
    this.description,
    this.sId,
    this.price,
    this.active,
    //this.subCategory,
    this.image,
    this.publicId,
    this.ratingsQuantity,
    //this.category
  });

  //from json
  factory DataProductResponse.fromJson(Map<String, dynamic> json) =>
      _$DataProductResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$DataProductResponseToJson(this);
}
