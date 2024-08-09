import 'package:json_annotation/json_annotation.dart';

part 'add_item.g.dart';

@JsonSerializable()
class AddItemToCartResponse {
  bool? status;
  String? message;
  int? numOfCartItems;
  AddItemToCartData? data;

  AddItemToCartResponse(
      {this.status, this.message, this.numOfCartItems, this.data});

  //from json
  factory AddItemToCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddItemToCartResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$AddItemToCartResponseToJson(this);
}

@JsonSerializable()
class AddItemToCartData {
  String? user;
  List<CartItems>? cartItems;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? totalCartPrice;

  AddItemToCartData({
    this.user,
    this.cartItems,
    this.sId,
    this.createdAt,
    this.updatedAt,
    this.totalCartPrice,
  });

  //from json
  factory AddItemToCartData.fromJson(Map<String, dynamic> json) =>
      _$AddItemToCartDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$AddItemToCartDataToJson(this);
}

@JsonSerializable()
class CartItems {
  String? product;
  int? quantity;
  int? price;
  String? sId;
  int? totalItemPrice;

  CartItems(
      {this.product, this.quantity, this.price, this.sId, this.totalItemPrice});

  //from json
  factory CartItems.fromJson(Map<String, dynamic> json) =>
      _$CartItemsFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$CartItemsToJson(this);
}
