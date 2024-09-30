import '../../../../../core/common/shared/shared_imports.dart'; //

class FirebaseMessagingNavigator {
  // Handle notification when the app is in the foreground
  static Future<void> foreGroundHandler(RemoteMessage? remoteMessage) async {
    if (remoteMessage != null) {
      // Update the recieveNotification notifier to reflect that a new notification was received
      FirebaseCloudMessaging().recieveNotification.value = true;

      // Show local notification
      await LocalNotificationService.showSimpleNotification(
        title: remoteMessage.notification?.title ?? 'No Title',
        body: remoteMessage.notification?.body ?? 'No Body',
      );
    }
  }

 static  Future<void> checkTerminatedState() async {
    // Get any message which caused the app to open from a terminated state
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      FirebaseCloudMessaging().recieveNotification.value = true;
    }
  }
}
