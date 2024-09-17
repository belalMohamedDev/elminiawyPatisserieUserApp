import 'package:elminiawy/core/common/sharedWidget/custom_button.dart';
import 'package:elminiawy/core/style/images/asset_manger.dart';
import 'package:elminiawy/core/utils/extensions.dart';
import 'package:elminiawy/feature/order/data/model/response/get_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../cubit/payment_cubit.dart';
import '../refactor/order_details_body.dart';

class OrderDetails extends StatelessWidget {
  final GetOrdersResponseData? order;
  const OrderDetails({super.key, this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Order Details",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft),
          onPressed: () {
            if (order == null) {
              context.pushReplacementNamed(Routes.bottomNavBarRoute);
            } else {
              context.pop();
            }
          },
        ),
        actions: [
          order!.status == 0 || order!.status == 1
              ? TextButton(
                  onPressed: () {
                    cancelBottomSheet(context);
                  },
                  child: Text("Cancel",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.redError,
                          fontSize: 16.sp)),
                )
              : const SizedBox(),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: OrderDetailsBody(order: order),
    );
  }

  void cancelBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
        useRootNavigator: true,
        barrierColor: Colors.black54,
        elevation: 20.r,
        context: context,
        builder: (context) => SizedBox(
              height: 350.h,
              child: Padding(
                padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    Image.asset(
                      ImageAsset.basket,
                      height: 80.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                        'Are you sure you want to cancel\n your order? This can\'t be undone',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: FontConsistent.fontFamilyAcme,
                            color: ColorManger.brunLight,
                            fontSize: 16.sp)),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      onPressed: () {
                        context.read<PaymentCubit>().ordercancelSummit(context
                            .read<PaymentCubit>()
                            .createOrderResponseData!
                            .sId!);
                      },
                      radius: 8.r,
                      widget: Text('Yes, Cancel',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: FontConsistent.fontFamilyAcme,
                                  color: ColorManger.white,
                                  fontSize: 14.sp)),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomButton(
                      onPressed: () {
                        context.pop();
                      },
                      radius: 8.r,
                      color: ColorManger.brownLight,
                      widget: Text('No, Keep it',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontFamily: FontConsistent.fontFamilyAcme,
                                  color: ColorManger.brun,
                                  fontSize: 14.sp)),
                    )
                  ],
                ),
              ),
            ));
  }
}
