class ProductResponse {
  bool? status;
  String? message;
  PaginationRuslt? paginationRuslt;
  List<Data>? data;

  ProductResponse({this.status, this.message, this.paginationRuslt, this.data});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    paginationRuslt = json['paginationRuslt'] != null
        ? PaginationRuslt.fromJson(json['paginationRuslt'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (paginationRuslt != null) {
      data['paginationRuslt'] = paginationRuslt!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaginationRuslt {
  int? currentPage;
  int? limit;
  int? skip;
  int? numberOfPages;
  int? next;

  PaginationRuslt(
      {this.currentPage, this.limit, this.skip, this.numberOfPages, this.next});

  PaginationRuslt.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    skip = json['skip'];
    numberOfPages = json['numberOfPages'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['limit'] = limit;
    data['skip'] = skip;
    data['numberOfPages'] = numberOfPages;
    data['next'] = next;
    return data;
  }
}

class Data {
  String? title;
  String? description;
  String? sId;
  int? price;
  String? subCategory;
  String? image;
  String? publicId;
  int? ratingsQuantity;
  String? category;

  Data(
      {this.title,
      this.description,
      this.sId,
      this.price,
      this.subCategory,
      this.image,
      this.publicId,
      this.ratingsQuantity,
      this.category});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    sId = json['_id'];
    price = json['price'];
    subCategory = json['subCategory'];
    image = json['image'];
    publicId = json['publicId'];
    ratingsQuantity = json['ratingsQuantity'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['_id'] = sId;
    data['price'] = price;
    data['subCategory'] = subCategory;
    data['image'] = image;
    data['publicId'] = publicId;
    data['ratingsQuantity'] = ratingsQuantity;
    data['category'] = category;
    return data;
  }
}
