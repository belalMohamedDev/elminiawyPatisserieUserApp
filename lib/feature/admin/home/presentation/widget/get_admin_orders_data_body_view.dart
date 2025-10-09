import 'package:elminiawy/feature/admin/home/presentation/screen/order_details_screen.dart';
import 'package:elminiawy/feature/admin/home/presentation/widget/get_admin_orders_data_loading_view.dart';

import '../../../../../core/common/shared/shared_imports.dart';

class GetAdminOrdersDataBodyView extends StatelessWidget {
  const GetAdminOrdersDataBodyView(
    this.state, {
    super.key,
    this.isCompleteOrder = false,
    this.isCancelledOrder = false,
  });

  final AdminHomeState state;
  final bool isCompleteOrder;
  final bool isCancelledOrder;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    final getPendingOrders = context.read<AdminHomeCubit>().getAdminOrders;
    return state is GetAdminOrdersLoading || state is GetAdminOrdersError
        ? GetAdminOrdersDataLoadingView(isCompleteOrder: isCompleteOrder)
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
                                  SizedBox(
                                    width: 160,
                                    height: 40,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ColorManger.brunLight,
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
                                                  getPendingOrders[index].sId!,
                                                  "",
                                                  DateTime.now()
                                                      .toIso8601String(),
                                                  5);
                                        },
                                        child: const Text("Cancel")),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 160,
                                    height: 40,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
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
                                                  getPendingOrders[index].sId!,
                                                  DateTime.now()
                                                      .toIso8601String(),
                                                  "",
                                                  1);
                                        },
                                        child: const Text("Accept")),
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
