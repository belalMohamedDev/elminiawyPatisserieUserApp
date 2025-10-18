class GetOrderStatusCountResponse {
  bool? status;
  String? message;
  GetOrderStatusCountDataResponse? data;

  GetOrderStatusCountResponse({this.status, this.message, this.data});

  GetOrderStatusCountResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? GetOrderStatusCountDataResponse.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GetOrderStatusCountDataResponse {
  int? newOrders;
  int? pendingOrders;
  int? pendingDriver;
  int? deliveredOrders;
  int? completeOrders;
  int? cancelledOrders;
  double? totalSalesToday;
  double? totalSalesLastWeek;
  int? totalItemsSoldLastWeek;
  int? topProducts;

  GetOrderStatusCountDataResponse({
    this.newOrders,
    this.pendingOrders,
    this.pendingDriver,
    this.deliveredOrders,
    this.completeOrders,
    this.cancelledOrders,
    this.totalSalesToday,
    this.totalSalesLastWeek,
    this.totalItemsSoldLastWeek,
    this.topProducts,
  });

  GetOrderStatusCountDataResponse.fromJson(Map<String, dynamic> json) {
    newOrders = json['newOrders'];
    pendingOrders = json['pendingOrders'];
    pendingDriver = json['pendingDriver'];
    deliveredOrders = json['DeliveredOrders'];
    completeOrders = json['completeOrders'];
    cancelledOrders = json['cancelledOrders'];
    totalSalesToday = (json['totalSalesToday'] ?? 0).toDouble();
    totalSalesLastWeek = (json['totalSalesLastWeek'] ?? 0).toDouble();
    totalItemsSoldLastWeek = json['totalItemsSoldLastWeek'];
    topProducts = json['topProducts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newOrders'] = newOrders;
    data['pendingOrders'] = pendingOrders;
    data['pendingDriver'] = pendingDriver;
    data['DeliveredOrders'] = deliveredOrders;
    data['completeOrders'] = completeOrders;
    data['cancelledOrders'] = cancelledOrders;
    data['totalSalesToday'] = totalSalesToday;
    data['totalSalesLastWeek'] = totalSalesLastWeek;
    data['totalItemsSoldLastWeek'] = totalItemsSoldLastWeek;
    data['topProducts'] = topProducts;
    return data;
  }
}
