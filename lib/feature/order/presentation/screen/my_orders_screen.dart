import 'package:cached_network_image/cached_network_image.dart';
import 'package:elminiawy/core/utils/date_extension.dart';
import 'package:elminiawy/feature/order/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/loading/loading_shimmer.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/images/asset_manger.dart';
import '../../data/model/response/get_order.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        context.read<PaymentCubit>().getCompleteOrdersSummit(),
        context.read<PaymentCubit>().getOrdersPendingSummit(),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Orders",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
        // leading: IconButton(
        //   icon: const Icon(IconlyBroken.arrowLeft),
        //   onPressed: () {},
        // ),
      ),
      body: const MyOrdersBody(),
    );
  }
}

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
              EdgeInsets.only(left: 55.w, right: 55.w, top: 20.h, bottom: 20.h),
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
                    return OrdersTab(
                      getOrdersResponseData:
                          context.read<PaymentCubit>().getCurrentOrders,
                    );
                  }

                  return ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, bottom: 15.h),
                          child: _cardItemLoading(),
                        );
                      });
                },
              ),
              BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  if (state is GetCompleteOrdersSuccess) {
                    return OrdersTab(
                      getOrdersResponseData:
                          context.read<PaymentCubit>().getPerviousOrders,
                    );
                  }

                  return ListView.builder(
                      itemCount: 5,
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
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10.w,
          ),
          Image.asset(
            ImageAsset.picture,
            height: 60.h,
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

class OrdersTab extends StatelessWidget {
  final List<GetOrdersResponseData> getOrdersResponseData;

  const OrdersTab({super.key, required this.getOrdersResponseData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: getOrdersResponseData.length,
      itemBuilder: (context, index) {
        final order = getOrdersResponseData[index];
        return Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 15.h),
          child: Container(
            width: double.infinity,
            height: 80.h,
            decoration: BoxDecoration(
              color: ColorManger.backgroundItem,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorManger.brownLight,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: order.cartItems!.first.product!.image ?? '',
                    height: 60.h,
                    placeholder: (context, url) => Image.asset(
                      ImageAsset.picture,
                      height: 60.h,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order No #${order.sId}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brun,
                          fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      order.createdAt!.getFormattedDate(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brunLight,
                          fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Text(
                          order.status == 0
                              ? "Order Placed"
                              : order.status == 1
                                  ? "Preparing"
                                  : order.status == 2
                                      ? "On its way"
                                      : order.status == 3
                                          ? "Delivered"
                                          : order.status == 4
                                              ? "Cancelled"
                                              : '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: FontConsistent.fontFamilyAcme,
                                  color: order.status == 4
                                      ? ColorManger.redError
                                      : Colors.green,
                                  fontSize: 12.sp),
                        ),
                        SizedBox(
                          width: 130.w,
                        ),
                        Text(
                          '${order.totalOrderPrice}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: FontConsistent.fontFamilyAcme,
                                  color: ColorManger.brun,
                                  fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ],
                )
                // const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
