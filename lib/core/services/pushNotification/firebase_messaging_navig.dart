import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_cloud_messaging.dart';
import 'local_notification.dart';

class FirebaseMessagingNavigator {
  //forground
  static Future<void> foreGroundHandler(RemoteMessage? remoteMessage) async {
     FirebaseCloudMessaging().recieveNotification.value = true;
    if (remoteMessage != null) {
      await LocalNotificationService.showSimpleNotification(
          title: remoteMessage.notification!.title!,
          body: remoteMessage.notification!.body!);
    }
  }



}
