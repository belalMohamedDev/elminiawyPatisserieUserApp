import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/home/presentation/widget/driver_order.dart';
import 'package:elminiawy/feature/admin/home/presentation/widget/home_app_bar.dart';

import '../widget/home_orders.dart';
import '../widget/home_sales.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    Future.wait([
      context.read<AdminHomeCubit>().getOrdersStatusAndSalesTodayCountSummit(),
      context.read<CartCubit>().getCartItem(),
      context.read<CategoryCubit>().getCategories(),
    ]);

    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      context.read<AdminHomeCubit>().getOrdersStatusAndSalesTodayCountSummit();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;

    final responsive = ResponsiveUtils(context);

    return BlocBuilder<AdminHomeCubit, AdminHomeState>(
      builder: (context, state) {
        final adminHomeCubit = context.watch<AdminHomeCubit>();
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: adminHomeCubit.drawerIsOpen
                ? ColorManger.brun
                : ColorManger.white,
          ),
          child: GestureDetector(
            onTap: () {
              if (adminHomeCubit.drawerIsOpen) {
                adminHomeCubit.drawerOpenOrClose(
                  0,
                  0,
                  1,
                  0,
                  false,
                  !isEnLocale,
                );
              }
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  adminHomeCubit.drawerIsOpen ? 50 : 0,
                ),
                color: ColorManger.white,
              ),
              transform:
                  Matrix4.translationValues(
                      adminHomeCubit.xOffset,
                      adminHomeCubit.yOffset,
                      0,
                    )
                    ..rotateZ(adminHomeCubit.rotate)
                    ..scaleByDouble(
                      adminHomeCubit.scaleFactor,
                      adminHomeCubit.scaleFactor,
                      adminHomeCubit.scaleFactor,
                      1.0,
                    ),
              duration: const Duration(milliseconds: 250),
              child: Stack(
                children: [
                  RefreshIndicator(
                    color: ColorManger.brun,
                    backgroundColor: ColorManger.backgroundItem,
                    strokeWidth: 3,
                    onRefresh: () async {
                      await context
                          .read<AdminHomeCubit>()
                          .getOrdersStatusAndSalesTodayCountSummit();
                    },
                    child: ListView(
                      children: [
                        HomeAppBar(adminHomeCubit: adminHomeCubit),
                        const HomeOrders(),
                        const DriverOrder(),
                        const HomeSales(),
                      ],
                    ),
                  ),
                  Positioned(
                    right: responsive.screenWidth / 2.4,
                    bottom: responsive.setHeight(3.5),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: instance<CategoryCubit>(),
                              child: const CategoryView(
                                isCategoryCartToAdmin: true,
                              ),
                            ),
                          ),
                        );
                      },
                      backgroundColor: ColorManger.brun,
                      child: Icon(Icons.add, color: ColorManger.backgroundItem),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
