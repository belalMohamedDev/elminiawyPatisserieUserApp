import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../app_storage_key.dart';
import '../shared_pref_helper.dart';
import 'firebase_messaging_navig.dart';

class FirebaseCloudMessaging {
  factory FirebaseCloudMessaging() => _instance;
  FirebaseCloudMessaging._();

  static final FirebaseCloudMessaging _instance = FirebaseCloudMessaging._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  ValueNotifier<bool> isNotificationSubscribe = ValueNotifier(false);
  bool hasNotificationPermission = false;

  late final String _subscribeKey;

  Future<void> init() async {
    _subscribeKey = await _getValidSubscribeKey();

    if (_subscribeKey.isNotEmpty) {
      await _requestNotificationPermissions();
    } else {
      debugPrint('⚠️ subscribeKey is invalid after sanitizing');
    }

    FirebaseMessaging.onMessage
        .listen(FirebaseMessagingNavigator.foreGroundHandler);
  }

  Future<String> _getValidSubscribeKey() async {
    String key = await SharedPrefHelper.getSecuredString(PrefKeys.userId);
    return _sanitizeTopic(key);
  }

  String _sanitizeTopic(String topic) {
    return topic.toLowerCase().replaceAll(RegExp(r'[^a-z0-9_]'), '');
  }

  /// controller for the notification if user subscribe or unsubscribed
  /// or accpeted the permission or not
  Future<void> toggleNotificationSubscription() async {
    if (hasNotificationPermission == false) {
      await _requestNotificationPermissions();
    } else {
      if (isNotificationSubscribe.value == false) {
        await _subscribeToNotifications();
      } else {
        await _unsubscribeFromNotifications();
      }
    }
  }

  /// permissions to notifications
  Future<void> _requestNotificationPermissions() async {
    final settings = await _firebaseMessaging.requestPermission(badge: false);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      /// subscribe to notifications topic

      hasNotificationPermission = true;
      await _subscribeToNotifications();
      debugPrint('🔔 User accepted notification permissions');
    } else {
      hasNotificationPermission = false;
      isNotificationSubscribe.value = false;
      debugPrint('🔕 User denied notification permissions');
    }
  }

  /// subscribe notification
  Future<void> _subscribeToNotifications() async {
    isNotificationSubscribe.value = true;
    await FirebaseMessaging.instance.subscribeToTopic(_subscribeKey);
    debugPrint('====🔔 Notification Subscribed 🔔=====');
  }

  /// unsubscribe notification
  Future<void> _unsubscribeFromNotifications() async {
    isNotificationSubscribe.value = false;
    await FirebaseMessaging.instance.unsubscribeFromTopic(_subscribeKey);
    debugPrint('====🔕 Notification Unsubscribed 🔕=====');
  }
}
