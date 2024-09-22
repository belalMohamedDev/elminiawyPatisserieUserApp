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
  ValueNotifier<bool> hasNotificationPermission = ValueNotifier(false);

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
    if (!hasNotificationPermission.value) {
      await _requestNotificationPermissions();
    } else {
      if (isNotificationSubscribe.value) {
        await _unsubscribeFromNotifications();
      } else {
        await _subscribeToNotifications();
      }
    }
  }

  /// permissions to notifications
  Future<void> _requestNotificationPermissions() async {
    final settings = await _firebaseMessaging.requestPermission(badge: false);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      /// subscribe to notifications topic

      hasNotificationPermission.value = true;
      await _subscribeToNotifications();
      debugPrint('🔔 User accepted notification permissions');
    } else {
      hasNotificationPermission.value = false;
      isNotificationSubscribe.value = false;
      debugPrint('🔕 User denied notification permissions');
    }
  }

  /// subscribe notification
  Future<void> _subscribeToNotifications() async {
    if (_subscribeKey.isNotEmpty) {
      await _firebaseMessaging.subscribeToTopic(_subscribeKey);
      isNotificationSubscribe.value = true;
      debugPrint('🔔 Subscribed to notifications for topic: $_subscribeKey');
    } else {
      debugPrint('⚠️ Invalid subscribe key, cannot subscribe');
    }
  }

  /// unsubscribe notification
  Future<void> _unsubscribeFromNotifications() async {
    if (_subscribeKey.isNotEmpty) {
      await _firebaseMessaging.unsubscribeFromTopic(_subscribeKey);
      isNotificationSubscribe.value = false;
      debugPrint(
          '🔕 Unsubscribed from notifications for topic: $_subscribeKey');
    } else {
      debugPrint('⚠️ Invalid subscribe key, cannot unsubscribe');
    }
  }
}
