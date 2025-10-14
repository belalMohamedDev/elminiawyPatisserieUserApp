import 'package:json_annotation/json_annotation.dart';
part 'create_order_request.g.dart';

@JsonSerializable(includeIfNull: false)
class CreateOrderRequestBody {
  CreateOrderRequestBody({
    this.shippingAddress,
    this.nearbyStoreAddress,
    this.notes,
    this.customerName,
    this.customerPhone,
    this.customerAddressText ,
    this.orderSource
  });

  final String? shippingAddress;
  final String? nearbyStoreAddress;
  final String? notes;


//admin side
  final String? customerName;
  final String? customerPhone;
  final String? customerAddressText;
  final String? orderSource;

  //from json
  factory CreateOrderRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestBodyFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$CreateOrderRequestBodyToJson(this);
}
