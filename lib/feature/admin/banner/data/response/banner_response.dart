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

  String? startDate;
  String? endDate;

  DataBannerResponse({
    this.sId,
    this.image,
    this.startDate,
    this.endDate,
  });

  DataBannerResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];

    startDate = json['startDate'];
    endDate = json['endDate'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['image'] = image;


    data['startDate'] = startDate;
    data['endDate'] = endDate;

    return data;
  }
}
