import '../../../../../core/common/shared/shared_imports.dart';

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

    _notificationService = NotificationService(
      instance<UserNotificationRepositoryImplement>(),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<LogOutCubit>().getUserName();

      if (!AppInitialRoute.isAnonymousUser) {
        _notificationService.fetchNotificationsContinuously();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeBody(notificationService: _notificationService),
      ),
    );
  }

  @override
  void dispose() {
    _notificationService.stopFetchingNotifications();
    super.dispose();
  }
}
