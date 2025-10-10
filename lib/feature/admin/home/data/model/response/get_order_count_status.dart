class GetOrderStatusCountResponse {
  bool? status;
  String? message;
  Data? data;

  GetOrderStatusCountResponse({this.status, this.message, this.data});

  GetOrderStatusCountResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  int? newOrders;
  int? pendingOrders;
  int? completeOrders;
  int? cancelledOrders;
  int? totalSalesToday;
  int? totalSalesLastWeek;
  int? totalItemsSoldLastWeek;

  Data(
      {this.newOrders,
      this.pendingOrders,
      this.completeOrders,
      this.cancelledOrders,
      this.totalSalesToday,
      this.totalSalesLastWeek,
      this.totalItemsSoldLastWeek});

  Data.fromJson(Map<String, dynamic> json) {
    newOrders = json['newOrders'];
    pendingOrders = json['pendingOrders'];
    completeOrders = json['completeOrders'];
    cancelledOrders = json['cancelledOrders'];
    totalSalesToday = json['totalSalesToday'];
    totalSalesLastWeek = json['totalSalesLastWeek'];
    totalItemsSoldLastWeek = json['totalItemsSoldLastWeek'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newOrders'] = newOrders;
    data['pendingOrders'] = pendingOrders;
    data['completeOrders'] = completeOrders;
    data['cancelledOrders'] = cancelledOrders;
    data['totalSalesToday'] = totalSalesToday;
    data['totalSalesLastWeek'] = totalSalesLastWeek;
    data['totalItemsSoldLastWeek'] = totalItemsSoldLastWeek;
    return data;
  }
}
