import 'dart:async';
import '../data/repository/user_notification_repo.dart';
import '../data/model/user_notification_resp.dart';

import 'package:flutter/material.dart';

class NotificationService {
  NotificationService(this._repository, this.recieveNotification);

  final UserNotificationRepositoryImplement _repository;

  final ValueNotifier<bool> recieveNotification;

  final StreamController<UserNotificationResponse> _notificationController =
      StreamController<UserNotificationResponse>.broadcast();
  Timer? _timer;

  Stream<UserNotificationResponse> get notificationStream =>
      _notificationController.stream;

  void listenToNotificationChanges() {
    recieveNotification.addListener(() {
      if (recieveNotification.value == true) {
        fetchNotificationsOnce();
        fetchNotificationsContinuously();
      } else {
        stopFetchingNotifications();
      }
    });
  }

  Future<void> fetchNotificationsOnce() async {
    try {
      final response = await _fetchNotifications();
      _notificationController.sink.add(response);
    } catch (error) {
      _notificationController.sink
          .addError('Failed to fetch notifications: $error');
    }
  }

  void fetchNotificationsContinuously() {
    _timer = Timer.periodic(const Duration(minutes: 5), (timer) async {
      try {
        final response = await _fetchNotifications();
        _notificationController.sink.add(response);
      } catch (error) {
        _notificationController.sink
            .addError('Failed to fetch notifications: $error');
      }
    });
  }

  Future<UserNotificationResponse> _fetchNotifications() async {
    final result = await _repository.getAllUserNotificationRepo();

    return result.when(
      success: (data) => data,
      failure: (error) {
        throw Exception('Failed to fetch notifications: ${error.message}');
      },
    );
  }

  void stopFetchingNotifications() {
    _timer?.cancel();
    _notificationController.close();
  }
}
