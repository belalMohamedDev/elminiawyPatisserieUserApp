import 'package:elminiawy/core/common/shared/shared_imports.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  StreamSubscription? _localeListener;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorManger.brun,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    if (context.read<LogOutCubit>().initialUserName != 'Guest User' &&
        AppInitialRoute.role != "admin") {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!mounted) return;

        await _loadOrders();
        if (!mounted) return;

        _localeListener = context.read<AppLogicCubit>().stream.listen((
          locale,
        ) async {
          if (!mounted) return;
          await _loadOrders();
        });
      });
    }

    if (AppInitialRoute.role == "admin") {
      context.read<LogOutCubit>().getUserName();
    }
  }

  Future<void> _loadOrders() async {
    if (!mounted) return;

    await Future.wait([
      context.read<PaymentCubit>().getCompleteOrdersSummit(),
      context.read<PaymentCubit>().getOrdersPendingSummit(),
    ]);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ProfileBody());
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorManger.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    _localeListener?.cancel();

    super.dispose();
  }
}
