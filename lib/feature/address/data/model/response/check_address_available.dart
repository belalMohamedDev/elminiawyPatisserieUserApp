class CheckLocationAvailableResponse {
  bool? status;
  String? message;
  String? address;
  bool? storeAddressAvailable;
  bool? isAddressAvailable;

  CheckLocationAvailableResponse(
      {this.status,
      this.message,
      this.address,
      this.storeAddressAvailable,
      this.isAddressAvailable});

  CheckLocationAvailableResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    address = json['address'];
    storeAddressAvailable = json['StoreAddressAvailable'];
    isAddressAvailable = json['isAddressAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['address'] = address;
    data['StoreAddressAvailable'] = storeAddressAvailable;
    data['isAddressAvailable'] = isAddressAvailable;
    return data;
  }
}
