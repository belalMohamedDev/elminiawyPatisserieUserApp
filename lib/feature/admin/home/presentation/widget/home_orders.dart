import '../../../../../core/common/shared/shared_imports.dart';
import 'home_order_card_widget.dart';

class HomeOrders extends StatelessWidget {
  const HomeOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminHomeCubit, AdminHomeState>(
      builder: (context, state) {
        final adminHomeCubit = context.watch<AdminHomeCubit>();
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
                        title: context.translate(AppStrings.newOrders),
                        number:
                            '${adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.newOrders ?? 0}',
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
                        title: context.translate(AppStrings.completedOrders),
                        number:
                            '${adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.completeOrders ?? 0}',
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
                        title: context.translate(AppStrings.deliveredOrders),
                        number:
                            '${adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.deliveredOrders ?? 0}',
                        image: ImageAsset.deliveryBike,
                        cardContentColor: ColorManger.brun,
                        cardColor: ColorManger.brownLight,
                      ),
                      onTap: () {
                        context.pushNamed(Routes.deliveredOrders);
                      },
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.pendingOrders);
                      },
                      child: HomeOrderCardWidget(
                        title: context.translate(AppStrings.pendingOrders),
                        number:
                            '${adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.pendingOrders ?? 0} ',
                        image: ImageAsset.orderWaiting,
                        cardContentColor: ColorManger.white,
                        cardColor: const Color(
                          0xffe68636,
                        ).withValues(alpha: 0.8),
                        // isSalesToday: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
            //     child: Row(
            //       children: [
            //         GestureDetector(
            //           child: HomeOrderCardWidget(
            //             title: "Cancelled Orders",
            //             number:
            //                 '${widget.adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.cancelledOrders ?? 0}',
            //             image: ImageAsset.orderCancel,
            //             cardContentColor: ColorManger.brun,
            //             cardColor: ColorManger.brownLight,
            //           ),
            //           onTap: () {
            //             context.pushNamed(Routes.cancelledOrders);
            //           },
            //         ),
            //         const Spacer(),
            //         GestureDetector(
            //           onTap: () {
            //             context.pushNamed(Routes.pendingOrders);
            //           },
            //           child: HomeOrderCardWidget(
            //             title: "Pending Orders",
            //             number:
            //                 '${widget.adminHomeCubit.getOrdersStatusAndSalesTodayCount?.data!.pendingOrders ?? 0} ',
            //             image: ImageAsset.orderWaiting,
            //             cardContentColor: ColorManger.white,
            //             cardColor: const Color(0xffe68636).withOpacity(0.8),
            //             // isSalesToday: true,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
