class BranchStoreAddressResponse {
	bool? status;
	String? message;
	List<Data>? data;

	BranchStoreAddressResponse({this.status, this.message, this.data});

	BranchStoreAddressResponse.fromJson(Map<String, dynamic> json) {
		status = json['status'];
		message = json['message'];
		if (json['data'] != null) {
			data = <Data>[];
			json['data'].forEach((v) { data!.add(Data.fromJson(v)); });
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

class Data {
	Location? location;
	DeliveryZone? deliveryZone;
	String? branchArea;
	String? briefness;
	String? region;
	String? sId;
	String? createdAt;
	String? updatedAt;

	Data({this.location, this.deliveryZone, this.branchArea, this.briefness, this.region, this.sId, this.createdAt, this.updatedAt});

	Data.fromJson(Map<String, dynamic> json) {
		location = json['location'] != null ? Location.fromJson(json['location']) : null;
		deliveryZone = json['deliveryZone'] != null ? DeliveryZone.fromJson(json['deliveryZone']) : null;
		branchArea = json['BranchArea'];
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
		coordinates = json['coordinates'].cast<double>();
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
	List<Coordinates>? coordinates;

	DeliveryZone({this.type, this.coordinates});

	DeliveryZone.fromJson(Map<String, dynamic> json) {
		type = json['type'];
		if (json['coordinates'] != null) {
			coordinates = <Coordinates>[];
			json['coordinates'].forEach((v) { coordinates!.add(Coordinates.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['type'] = type;
		if (coordinates != null) {
	  data['coordinates'] = coordinates!.map((v) => v.toJson()).toList();
	}
		return data;
	}
}

class Coordinates {


	Coordinates();

	Coordinates.fromJson(Map<String, dynamic> json);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		return data;
	}
}