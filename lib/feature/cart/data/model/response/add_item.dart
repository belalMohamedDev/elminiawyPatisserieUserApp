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
  User? user;
  List<CartItems>? cartItems;
  String? sId;
  double? totalCartPrice;
  double? shippingPrice;
  double? taxPrice;
  double? totalOrderPrice;
  double? totalPriceAfterDiscount;
  double? couponDiscount;


 

  AddItemToCartData({
    this.user,
    this.cartItems,
    this.sId,
    this.totalCartPrice,
    this.shippingPrice,
    this.taxPrice,
    this.totalOrderPrice,
    this.totalPriceAfterDiscount,
    this.couponDiscount,
  });

  //from json
  factory AddItemToCartData.fromJson(Map<String, dynamic> json) =>
      _$AddItemToCartDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$AddItemToCartDataToJson(this);
}

@JsonSerializable()
class CartItems {
  int? quantity;
  int? price;
  String? sId;
  int? totalItemPrice;

  CartItems(
      { this.quantity, this.price, this.sId, this.totalItemPrice});

  //from json
  factory CartItems.fromJson(Map<String, dynamic> json) =>
      _$CartItemsFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$CartItemsToJson(this);
}

@JsonSerializable()
class User {
  String? sId;
  String? name;
  String? email;
  String? phone;

  User({this.sId, this.name, this.email, this.phone});

    //from json
  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

