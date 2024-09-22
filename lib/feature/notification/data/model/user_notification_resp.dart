import 'package:json_annotation/json_annotation.dart';
part 'user_notification_resp.g.dart';

@JsonSerializable()
class UserNotificationModel {
  bool? status;
  String? message;
  List<UserNotificationData>? data;

  UserNotificationModel({this.status, this.message, this.data});

  //from json
  factory UserNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$UserNotificationModelFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserNotificationModelToJson(this);

}

@JsonSerializable()

class UserNotificationData {
  bool? isSeen;
  String? sId;
  NotificationId? notificationId;

  UserNotificationData({this.isSeen, this.sId, this.notificationId});

  //from json
  factory UserNotificationData.fromJson(Map<String, dynamic> json) =>
      _$UserNotificationDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserNotificationDataToJson(this);
}

@JsonSerializable()

class NotificationId {
  String? sId;
  String? title;
  String? description;
 
  NotificationId(
      {this.sId,
      this.title,
      this.description,

    });


  //from json
  factory NotificationId.fromJson(Map<String, dynamic> json) =>
      _$NotificationIdFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$NotificationIdToJson(this);

}
