import 'package:flutter/material.dart';

import '../../../../core/application/di.dart';
import '../../../../core/services/app_storage_key.dart';
import '../../../../core/services/shared_pref_helper.dart';
import '../../../notification/data/model/user_notification_resp.dart';
import '../../../notification/logic/notification_service.dart';
import '../refactor/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final NotificationService _notificationService;
  late final Stream<UserNotificationResponse> _notificationStream;
  @override
  void initState() {
    super.initState();
    _notificationService = instance<NotificationService>();
    _notificationStream = _notificationService.notificationStream;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String initialUserName =
          await SharedPrefHelper.getSecuredString(PrefKeys.userName);
      if (initialUserName.isNotEmpty) {
        _notificationService.fetchNotificationsContinuously();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(
          notificationService: _notificationService,
          notificationStream: _notificationStream),
    );
  }

  @override
  void dispose() {
    _notificationService.stopFetchingNotifications();
    super.dispose();
  }
}
