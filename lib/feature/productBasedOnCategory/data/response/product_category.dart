import 'package:json_annotation/json_annotation.dart';
part 'product_category.g.dart';

@JsonSerializable()
class GetProductsBasedOnCategory {
  bool? status;
  String? message;
  List<Products>? allProducts;
  List<Data>? data;

  GetProductsBasedOnCategory(
      {this.status, this.message, this.allProducts, this.data});

  //from json
  factory GetProductsBasedOnCategory.fromJson(Map<String, dynamic> json) =>
      _$GetProductsBasedOnCategoryFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$GetProductsBasedOnCategoryToJson(this);
}

@JsonSerializable()
class Products {
  String? title;
  String? description;
  int? ratingsAverage;
  String? sId;
  int? price;
  String? subCategory;
  String? image;
  String? publicId;
  int? ratingsQuantity;

  String? category;

  Products(
      {this.title,
      this.description,
      this.ratingsAverage,
      this.sId,
      this.price,
      this.subCategory,
      this.image,
      this.publicId,
      this.ratingsQuantity,
      this.category});

  //from json
  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}

@JsonSerializable()
class Data {
  String? id;
  String? title;
  List<Products>? products;

  Data({this.id, this.title, this.products});

  //from json
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
