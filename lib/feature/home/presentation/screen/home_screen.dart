


import '../../../../../core/common/shared/shared_imports.dart'; //

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
