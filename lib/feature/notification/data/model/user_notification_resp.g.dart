// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notification_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserNotificationModel _$UserNotificationModelFromJson(
        Map<String, dynamic> json) =>
    UserNotificationModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserNotificationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserNotificationModelToJson(
        UserNotificationModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UserNotificationData _$UserNotificationDataFromJson(
        Map<String, dynamic> json) =>
    UserNotificationData(
      isSeen: json['isSeen'] as bool?,
      sId: json['sId'] as String?,
      notificationId: json['notificationId'] == null
          ? null
          : NotificationId.fromJson(
              json['notificationId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserNotificationDataToJson(
        UserNotificationData instance) =>
    <String, dynamic>{
      'isSeen': instance.isSeen,
      'sId': instance.sId,
      'notificationId': instance.notificationId,
    };

NotificationId _$NotificationIdFromJson(Map<String, dynamic> json) =>
    NotificationId(
      sId: json['sId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$NotificationIdToJson(NotificationId instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'title': instance.title,
      'description': instance.description,
    };
