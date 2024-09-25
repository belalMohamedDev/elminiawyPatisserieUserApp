import 'package:elminiawy/feature/order/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/loading/loading_shimmer.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/images/asset_manger.dart';
import '../screen/empty_order_screen.dart';
import '../widget/order_tab.dart';

class MyOrdersBody extends StatefulWidget {
  const MyOrdersBody({super.key});

  @override
  State<MyOrdersBody> createState() => _MyOrdersBodyState();
}

class _MyOrdersBodyState extends State<MyOrdersBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 55.w, right: 55.w, top: 20.h, bottom: 30.h),
          child: Container(
            decoration: BoxDecoration(
                color: ColorManger.brunLight,
                borderRadius: BorderRadius.circular(8.r)),
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'Current Orders',
                ),
                Tab(text: 'Previous Orders'),
              ],
              labelColor: ColorManger.white, // Text color of selected tab
              unselectedLabelColor: ColorManger.white,

              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: ColorManger.white,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft:
                      Radius.circular(_tabController.index == 0 ? 8.r : 0.r),
                  bottomLeft:
                      Radius.circular(_tabController.index == 0 ? 8.r : 0.r),
                  bottomRight:
                      Radius.circular(_tabController.index == 1 ? 8.r : 0.r),
                  topRight:
                      Radius.circular(_tabController.index == 1 ? 8.r : 0.r),
                ),
                color: ColorManger.brun,
              ), // Remove default indicator
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  if (state is GetCompleteOrdersSuccess) {
                    if (context.read<PaymentCubit>().getCurrentOrders.isEmpty) {
                      return const EmptyOrderScreen();
                    }
                    return OrdersTab(
                      getOrdersResponseData:
                          context.read<PaymentCubit>().getCurrentOrders,
                    );
                  }

                  return ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 20.w, bottom: 15.h),
                          child: _cardItemLoading(),
                        );
                      });
                },
              ),
              BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  if (state is GetCompleteOrdersSuccess) {
                    if (context
                        .read<PaymentCubit>()
                        .getPerviousOrders
                        .isEmpty) {
                      return const EmptyOrderScreen(
                        isCurrentOrder: false,
                      );
                    }
                    return OrdersTab(
                      getOrdersResponseData:
                          context.read<PaymentCubit>().getPerviousOrders,
                    );
                  }

                  return ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 20.w, bottom: 15.h),
                          child: _cardItemLoading(),
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Container _cardItemLoading() {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10.w,
          ),
          Image.asset(
            ImageAsset.picture,
            height: 40.h,
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoadingShimmer(
                height: 4.h,
                width: 220.w,
                borderRadius: 12.r,
              ),
              SizedBox(
                height: 10.h,
              ),
              LoadingShimmer(
                height: 4.h,
                width: 140.w,
                borderRadius: 12.r,
              ),
              SizedBox(
                height: 10.h,
              ),
              LoadingShimmer(
                height: 4.h,
                width: 80.w,
                borderRadius: 12.r,
              ),
            ],
          )
        ],
      ),
    );
  }
}
