

import '../../../../../core/common/shared/shared_imports.dart'; //

class FirebaseMessagingNavigator {
  //forground
  static Future<void> foreGroundHandler(RemoteMessage? remoteMessage) async {
    if (remoteMessage != null) {
      await LocalNotificationService.showSimpleNotification(
          title: remoteMessage.notification!.title!,
          body: remoteMessage.notification!.body!);
    }
  }
}
