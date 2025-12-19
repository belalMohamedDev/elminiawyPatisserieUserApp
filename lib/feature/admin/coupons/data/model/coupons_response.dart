class CouponsResponse {
  bool? status;
  String? message;
  dynamic data; 

  CouponsResponse({this.status, this.message, this.data});

  CouponsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    if (json['data'] is List) {
      data = (json['data'] as List)
          .map((e) => CouponsData.fromJson(e))
          .toList();
    } else if (json['data'] is Map) {
      data = CouponsData.fromJson(json['data']);
    }
  }

  List<CouponsData> get list => data is List<CouponsData> ? data : [];


  CouponsData? get item => data is CouponsData ? data : null;
}

class CouponsData {
  String? sId;
  String? title;
  String? expire;
  int? discount;
  String? createdAt;
  String? updatedAt;

  CouponsData({
    this.sId,
    this.title,
    this.expire,
    this.discount,
    this.createdAt,
    this.updatedAt,
  });

  CouponsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    expire = json['expire'];
    discount = json['discount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['expire'] = expire;
    data['discount'] = discount;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
