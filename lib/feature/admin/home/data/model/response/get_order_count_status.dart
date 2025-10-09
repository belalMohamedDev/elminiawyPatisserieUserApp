class GetOrderStatusCountResponse {
  bool? status;
  String? message;
  List<Data>? data;

  GetOrderStatusCountResponse({this.status, this.message, this.data});

  GetOrderStatusCountResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? newOrders;
  int? pendingOrders;
  int? completeOrders;
  int? cancelledOrders;
  int? totalSalesToday;

  Data(
      {this.newOrders,
      this.pendingOrders,
      this.completeOrders,
      this.cancelledOrders,
      this.totalSalesToday});

  Data.fromJson(Map<String, dynamic> json) {
    newOrders = json['newOrders'];
    pendingOrders = json['pendingOrders'];
    completeOrders = json['completeOrders'];
    cancelledOrders = json['cancelledOrders'];
    totalSalesToday = json['totalSalesToday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newOrders'] = newOrders;
    data['pendingOrders'] = pendingOrders;
    data['completeOrders'] = completeOrders;
    data['cancelledOrders'] = cancelledOrders;
    data['totalSalesToday'] = totalSalesToday;
    return data;
  }
}
