import '../../../../../core/common/shared/shared_imports.dart'; //

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final NotificationService _notificationService;
  @override
  void initState() {
    super.initState();

    final FirebaseCloudMessaging firebaseCloudMessaging =
        FirebaseCloudMessaging();

    _notificationService = NotificationService(
      instance<UserNotificationRepositoryImplement>(),
      firebaseCloudMessaging.recieveNotification,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String initialUserName =
          await SharedPrefHelper.getSecuredString(PrefKeys.userName);
      if (initialUserName.isNotEmpty) {
        _notificationService.listenToNotificationChanges();
        _notificationService.fetchNotificationsContinuously();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(
        notificationService: _notificationService,
      ),
    );
  }

  @override
  void dispose() {
    _notificationService.stopFetchingNotifications();
    super.dispose();
  }
}
