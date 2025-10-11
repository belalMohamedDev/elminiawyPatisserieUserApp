import '../../../../../core/common/shared/shared_imports.dart';
import 'home_order_card_widget.dart';

class HomeOrders extends StatefulWidget {
  const HomeOrders({
    super.key,
    required this.adminHomeCubit,
  });
  final AdminHomeCubit adminHomeCubit;

  @override
  State<HomeOrders> createState() => _HomeOrdersState();
}

class _HomeOrdersState extends State<HomeOrders> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    Future.wait([
      context.read<AdminHomeCubit>().getOrdersStatusAndSalesTodayCountSummit(),
      context.read<CartCubit>().getCartItem(),
      context.read<CategoryCubit>().getCategories()
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
    return BlocBuilder<AdminHomeCubit, AdminHomeState>(
      builder: (context, state) {
        return Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.newOrders);
                      },
                      child: HomeOrderCardWidget(
                        title: "New Orders",
                        number:
                            '${widget.adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.newOrders ?? 0}',
                        image: ImageAsset.order,
                        cardContentColor: ColorManger.backgroundItem,
                        cardColor: ColorManger.brun,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.completeOrders);
                      },
                      child: HomeOrderCardWidget(
                        title: "Completed Orders",
                        number:
                            '${widget.adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.completeOrders ?? 0}',
                        image: ImageAsset.orderDelivered,
                        cardContentColor: ColorManger.brun,
                        cardColor: ColorManger.brownLight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      child: HomeOrderCardWidget(
                        title: "Cancelled Orders",
                        number:
                            '${widget.adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.cancelledOrders ?? 0}',
                        image: ImageAsset.orderCancel,
                        cardContentColor: ColorManger.brun,
                        cardColor: ColorManger.brownLight,
                      ),
                      onTap: () {
                        context.pushNamed(Routes.cancelledOrders);
                      },
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.pendingOrders);
                      },
                      child: HomeOrderCardWidget(
                        title: "Pending Orders",
                        number:
                            '${widget.adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.pendingOrders ?? 0} ',
                        image: ImageAsset.orderWaiting,
                        cardContentColor: ColorManger.white,
                        cardColor: const Color(0xffe68636).withOpacity(0.8),
                        // isSalesToday: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
