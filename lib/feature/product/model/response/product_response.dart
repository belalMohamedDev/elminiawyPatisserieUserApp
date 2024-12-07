import '../../../../core/common/shared/shared_imports.dart'; //

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  bool? status;
  String? message;

  @JsonKey(name: "data")
  List<DataProductResponse>? data;

  ProductResponse({this.status, this.message, this.data});

  //from json
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
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
