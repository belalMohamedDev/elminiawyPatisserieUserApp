class BannerResponse {
  bool? status;
  String? message;

  List<DataBannerResponse>? data;

  BannerResponse({this.status, this.message, this.data});

  BannerResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    if (json['data'] != null) {
      data = <DataBannerResponse>[];
      json['data'].forEach((v) {
        data!.add(DataBannerResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class DataBannerResponse {
  String? sId;
  String? image;
  String? publicId;
  String? title;
  String? startDate;
  String? endDate;
  String? status;
  String? category;
  List<String>? product;
  int? discount;
  String? createdAt;
  String? updatedAt;

  DataBannerResponse(
      {this.sId,
      this.image,
      this.publicId,
      this.title,
      this.startDate,
      this.endDate,
      this.status,
      this.category,
      this.product,
      this.discount,
      this.createdAt,
      this.updatedAt});

  DataBannerResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    publicId = json['publicId'];
    title = json['title'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
    category = json['category'];
    product = json['product'].cast<String>();
    discount = json['discount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['image'] = image;
    data['publicId'] = publicId;
    data['title'] = title;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['status'] = status;
    data['category'] = category;
    data['product'] = product;
    data['discount'] = discount;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
