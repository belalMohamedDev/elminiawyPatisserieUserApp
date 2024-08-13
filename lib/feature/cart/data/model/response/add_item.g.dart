// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddItemToCartResponse _$AddItemToCartResponseFromJson(
        Map<String, dynamic> json) =>
    AddItemToCartResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : AddItemToCartData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddItemToCartResponseToJson(
        AddItemToCartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'data': instance.data,
    };

AddItemToCartData _$AddItemToCartDataFromJson(Map<String, dynamic> json) =>
    AddItemToCartData(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      sId: json['sId'] as String?,
      totalCartPrice: (json['totalCartPrice'] as num?)?.toDouble(),
      shippingPrice: (json['shippingPrice'] as num?)?.toDouble(),
      taxPrice: (json['taxPrice'] as num?)?.toDouble(),
      totalOrderPrice: (json['totalOrderPrice'] as num?)?.toDouble(),
      totalPriceAfterDiscount:
          (json['totalPriceAfterDiscount'] as num?)?.toDouble(),
      couponDiscount: (json['couponDiscount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AddItemToCartDataToJson(AddItemToCartData instance) =>
    <String, dynamic>{
      'user': instance.user,
      'cartItems': instance.cartItems,
      'sId': instance.sId,
      'totalCartPrice': instance.totalCartPrice,
      'shippingPrice': instance.shippingPrice,
      'taxPrice': instance.taxPrice,
      'totalOrderPrice': instance.totalOrderPrice,
      'totalPriceAfterDiscount': instance.totalPriceAfterDiscount,
      'couponDiscount': instance.couponDiscount,
    };

CartItems _$CartItemsFromJson(Map<String, dynamic> json) => CartItems(
      quantity: (json['quantity'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      sId: json['sId'] as String?,
      totalItemPrice: (json['totalItemPrice'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CartItemsToJson(CartItems instance) => <String, dynamic>{
      'quantity': instance.quantity,
      'price': instance.price,
      'sId': instance.sId,
      'totalItemPrice': instance.totalItemPrice,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };
