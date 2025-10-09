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
  });

  final AdminHomeState state;
  final bool isCompleteOrder;
  final bool isCancelledOrder;
  final bool isPendingOrder;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    final getPendingOrders = context.read<AdminHomeCubit>().getAdminOrders;
    return state is GetAdminOrdersLoading || state is GetAdminOrdersError
        ? GetAdminOrdersDataLoadingView(
            isCompleteOrder: isCompleteOrder,
            isPendingOrder: isPendingOrder,
          )
        : ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderDetailsScreen(
                              orderModel: getPendingOrders[index],
                            )));
              },
              child: Padding(
                padding: responsive.setPadding(left: 4, right: 4, bottom: 2),
                child: Container(
                  height: responsive.setHeight(isCompleteOrder ? 12 : 18),
                  width: responsive.screenWidth,
                  decoration: BoxDecoration(
                      color: ColorManger.backgroundItem,
                      borderRadius:
                          BorderRadius.circular(responsive.setBorderRadius(3))),
                  child: Padding(
                    padding: responsive.setPadding(
                        left: 3, top: 2.4, bottom: 0.5, right: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImageAsset.groceries,
                                    height: 25,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "${getPendingOrders[index].cartItems!.length}",
                                    style: TextStyle(
                                        color: ColorManger.brun,
                                        fontSize: responsive.setTextSize(4)),
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
                                  Image.asset(
                                    ImageAsset.money,
                                    height: 25,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "${getPendingOrders[index].totalOrderPrice}",
                                    style: TextStyle(
                                        color: ColorManger.brun,
                                        fontSize: responsive.setTextSize(4)),
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
                                  Image.asset(
                                    ImageAsset.debitCard,
                                    height: 25,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "${getPendingOrders[index].paymentMethodType}",
                                    style: TextStyle(
                                        color: ColorManger.brun,
                                        fontSize: responsive.setTextSize(4)),
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
                                  Image.asset(
                                    ImageAsset.calendar,
                                    height: 25,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    isCancelledOrder
                                        ? getPendingOrders[index]
                                            .canceledAt!
                                            .getFormattedDate()
                                        : isCompleteOrder
                                            ? getPendingOrders[index]
                                                .adminCompletedAt!
                                                .getFormattedDate()
                                            : isPendingOrder
                                                ? getPendingOrders[index]
                                                    .adminAcceptedAt!
                                                    .getFormattedDate()
                                                : getPendingOrders[index]
                                                    .createdAt!
                                                    .getFormattedDate(),
                                    style: TextStyle(
                                        color: ColorManger.brun,
                                        fontSize: responsive.setTextSize(3.9)),
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
                                  isPendingOrder
                                      ? const SizedBox()
                                      : SizedBox(
                                          width: 160,
                                          height: 35,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: ColorManger
                                                    .brunLight
                                                    .withOpacity(0.4),
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
                                                        id: getPendingOrders[
                                                                index]
                                                            .sId!,
                                                        status: 5,
                                                        canceledAt: DateTime
                                                                .now()
                                                            .toIso8601String());
                                              },
                                              child: const Text("Cancel")),
                                        ),
                                  isPendingOrder
                                      ? const SizedBox()
                                      : const Spacer(),
                                  SizedBox(
                                    width: isPendingOrder ? 330 : 160,
                                    height: 35,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () {
                                          isPendingOrder
                                              ? context
                                                  .read<AdminHomeCubit>()
                                                  .updateAdminOrderStatusSummit(
                                                      id: getPendingOrders[index]
                                                          .sId!,
                                                      adminCompletedAt:
                                                          DateTime.now()
                                                              .toIso8601String(),
                                                      status: 2)
                                              : context
                                                  .read<AdminHomeCubit>()
                                                  .updateAdminOrderStatusSummit(
                                                      id: getPendingOrders[
                                                              index]
                                                          .sId!,
                                                      adminAcceptedAt: DateTime
                                                              .now()
                                                          .toIso8601String(),
                                                      status: 1);
                                        },
                                        child: Text(isPendingOrder
                                            ? "Order Done"
                                            : "Accept")),
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
