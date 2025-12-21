class BranchStoreAddressResponse {
  bool? status;
  String? message;
  List<Data>? data;

  BranchStoreAddressResponse({this.status, this.message, this.data});

  BranchStoreAddressResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    final rawData = json['data'];

    if (rawData is List) {
      // ✅ case: list
      data = rawData.map((e) => Data.fromJson(e)).toList();
    } else if (rawData is Map<String, dynamic>) {
      // ✅ case: single object
      data = [Data.fromJson(rawData)];
    } else {
      data = [];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}



class Data {
  Location? location;
  DeliveryZone? deliveryZone;
  String? branchArea;
  String? briefness;
  String? region;
  String? sId;
  String? createdAt;
  String? updatedAt;
  bool? active;

  Data(
      {this.location,
      this.deliveryZone,
      this.branchArea,
      this.briefness,
      this.region,
      this.sId,
      this.createdAt,this.active,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    deliveryZone = json['deliveryZone'] != null
        ? DeliveryZone.fromJson(json['deliveryZone'])
        : null;
    branchArea = json['BranchArea'];
    active = json['active'];
    briefness = json['briefness'];
    region = json['region'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (deliveryZone != null) {
      data['deliveryZone'] = deliveryZone!.toJson();
    }
    data['BranchArea'] = branchArea;
    data['briefness'] = briefness;
    data['region'] = region;
    data['active'] = active;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates =
        json['coordinates'] != null ? json['coordinates'].cast<double>() : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}

class DeliveryZone {
  String? type;
  List<List<List<double>>>? coordinates;

  DeliveryZone({this.type, this.coordinates});

  DeliveryZone.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['coordinates'] != null) {
      coordinates = (json['coordinates'] as List)
          .map((poly) => (poly as List)
              .map((point) => (point as List).cast<double>())
              .toList())
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}
