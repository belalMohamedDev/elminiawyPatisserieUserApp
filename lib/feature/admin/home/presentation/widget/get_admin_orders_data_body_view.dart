import 'package:elminiawy/feature/admin/home/presentation/screen/assign_driver.dart';
import 'package:elminiawy/feature/admin/home/presentation/screen/order_details_screen.dart';
import 'package:elminiawy/feature/admin/home/presentation/widget/get_admin_orders_data_loading_view.dart';

import '../../../../../core/common/shared/shared_imports.dart';

class GetAdminOrdersDataBodyView extends StatelessWidget {
  const GetAdminOrdersDataBodyView(
    this.state, {
    super.key,
    this.isCompleteOrder = false,
    this.isCancelledOrder = false,
    this.isPendingOrder = false,
    this.isPendingDriver = false,
    this.isDeliveredOrder = false,
  });

  final AdminHomeState state;
  final bool isCompleteOrder;
  final bool isCancelledOrder;
  final bool isPendingOrder;
  final bool isPendingDriver;
  final bool isDeliveredOrder;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    final getPendingOrders = context.read<AdminHomeCubit>().getAdminOrders;
    return state is GetAdminOrdersLoading || state is GetAdminOrdersError
        ? GetAdminOrdersDataLoadingView(
            isCompleteOrder: isCompleteOrder,
            isPendingOrder: isDeliveredOrder == true
                ? isDeliveredOrder
                : isPendingOrder,
          )
        : getPendingOrders.isEmpty
        ? const EmptyOrderScreen()
        : ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                if (!isPendingDriver) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailsScreen(
                        orderModel: getPendingOrders[index],
                      ),
                    ),
                  );
                  return;
                }
              },
              child: Padding(
                padding: responsive.setPadding(left: 4, right: 4, bottom: 2),
                child: Container(
                  height: responsive.setHeight(isCompleteOrder ? 12 : 18),
                  width: responsive.screenWidth,
                  decoration: BoxDecoration(
                    color: ColorManger.backgroundItem,
                    borderRadius: BorderRadius.circular(
                      responsive.setBorderRadius(3),
                    ),
                  ),
                  child: Padding(
                    padding: responsive.setPadding(
                      left: 3,
                      top: 2.4,
                      bottom: 0.5,
                      right: 3,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(ImageAsset.groceries, height: 25),
                                  const SizedBox(height: 15),
                                  Text(
                                    "${getPendingOrders[index].cartItems!.length}",
                                    style: TextStyle(
                                      color: ColorManger.brun,
                                      fontSize: responsive.setTextSize(4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 1,
                              color: Colors.grey.shade300,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(ImageAsset.money, height: 25),
                                  const SizedBox(height: 15),
                                  Text(
                                    "${getPendingOrders[index].totalOrderPrice!.round()}",
                                    style: TextStyle(
                                      color: ColorManger.brun,
                                      fontSize: responsive.setTextSize(4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 1,
                              color: Colors.grey.shade300,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(ImageAsset.debitCard, height: 25),
                                  const SizedBox(height: 15),
                                  Text(
                                    "${getPendingOrders[index].paymentMethodType}",
                                    style: TextStyle(
                                      color: ColorManger.brun,
                                      fontSize: responsive.setTextSize(4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 1,
                              color: Colors.grey.shade300,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(ImageAsset.calendar, height: 25),
                                  const SizedBox(height: 15),
                                  Text(
                                    isCancelledOrder
                                        ? getPendingOrders[index].canceledAt!
                                              .getFormattedDateDeleteYear()
                                        : isCompleteOrder
                                        ? getPendingOrders[index]
                                              .driverDeliveredAt!
                                              .getFormattedDateDeleteYear()
                                        : isPendingOrder
                                        ? getPendingOrders[index]
                                              .adminAcceptedAt!
                                              .getFormattedDateDeleteYear()
                                        : isDeliveredOrder
                                        ? getPendingOrders[index]
                                              .driverAcceptedAt!
                                              .getFormattedDateDeleteYear()
                                        : isPendingDriver
                                        ? getPendingOrders[index]
                                              .adminCompletedAt!
                                              .getFormattedDateDeleteYear()
                                        : getPendingOrders[index].createdAt!
                                              .getFormattedDateDeleteYear(),
                                    style: TextStyle(
                                      color: ColorManger.brun,
                                      fontSize: responsive.setTextSize(3.9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        isCompleteOrder ? const SizedBox() : const Spacer(),
                        isCompleteOrder
                            ? const SizedBox()
                            : Row(
                                children: [
                                  isPendingOrder ||
                                          isDeliveredOrder ||
                                          isPendingDriver
                                      ? const SizedBox()
                                      : SizedBox(
                                          width: 160,
                                          height: 35,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: ColorManger
                                                  .brunLight
                                                  .withValues(alpha: 0.4),
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<AdminHomeCubit>()
                                                  .updateAdminOrderStatusSummit(
                                                    id: getPendingOrders[index]
                                                        .sId!,
                                                    status: 5,
                                                    canceledAt: DateTime.now()
                                                        .toIso8601String(),
                                                  );
                                            },
                                            child: Text(
                                              context.translate(
                                                AppStrings.cancel,
                                              ),
                                            ),
                                          ),
                                        ),
                                  isPendingOrder ||
                                          isDeliveredOrder ||
                                          isPendingDriver
                                      ? const SizedBox()
                                      : const Spacer(),
                                  SizedBox(
                                    width:
                                        isPendingOrder ||
                                            isDeliveredOrder ||
                                            isPendingDriver
                                        ? responsive.screenWidth * 0.86
                                        : 160,
                                    height: 35,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorManger.brun
                                            .withValues(alpha: 0.7),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        final adminCubit = context
                                            .read<AdminHomeCubit>();
                                        final order = getPendingOrders[index];

                                        if (isPendingOrder) {
                                          if (order.orderSource == "in_store") {
                                            await adminCubit
                                                .updateAdminOrderStatusSummit(
                                                  id: order.sId!,
                                                  driverDeliveredAt:
                                                      DateTime.now()
                                                          .toIso8601String(),
                                                  status: 4,
                                                );
                                          } else {
                                            await adminCubit
                                                .updateAdminOrderStatusSummit(
                                                  id: order.sId!,
                                                  adminCompletedAt:
                                                      DateTime.now()
                                                          .toIso8601String(),
                                                  status: 2,
                                                );
                                          }
                                        } else if (isDeliveredOrder) {
                                          await adminCubit
                                              .updateAdminOrderStatusSummit(
                                                id: order.sId!,
                                                driverDeliveredAt:
                                                    DateTime.now()
                                                        .toIso8601String(),
                                                status: 4,
                                              );
                                        } else if (isPendingDriver) {
                                          final result = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MultiBlocProvider(
                                                    providers: [
                                                      BlocProvider(
                                                        create: (context) =>
                                                            instance<
                                                              AdminHomeCubit
                                                            >(),
                                                      ),
                                                      BlocProvider(
                                                        create: (context) =>
                                                            instance<
                                                              DriverCubit
                                                            >(),
                                                      ),
                                                    ],
                                                    child: AssignDriver(
                                                      orderModel: order,
                                                    ),
                                                  ),
                                            ),
                                          );

                                          if (result == true) {
                                            adminCubit.removeOrderLocally(
                                              order.sId!,
                                            );
                                          }
                                        } else {
                                          await adminCubit
                                              .updateAdminOrderStatusSummit(
                                                id: order.sId!,
                                                adminAcceptedAt: DateTime.now()
                                                    .toIso8601String(),
                                                status: 1,
                                              );
                                        }
                                      },
                                      child: Text(
                                        // isPendingOrder
                                        //     ? "Order Done"
                                        //     : isDeliveredOrder
                                        //     ? "Order Delivered"
                                        //     : isPendingDriver
                                        //     ? "Assign Driver"
                                        //     : "Accept",
                                        isPendingOrder
                                            ? context.translate(
                                                AppStrings.orderDone,
                                              )
                                            : isDeliveredOrder
                                            ? context.translate(
                                                AppStrings.orderDelivered,
                                              )
                                            : isPendingDriver
                                            ? context.translate(
                                                AppStrings.assignDriver,
                                              )
                                            : context.translate(
                                                AppStrings.accept,
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            itemCount: getPendingOrders.length,
          );
  }
}
