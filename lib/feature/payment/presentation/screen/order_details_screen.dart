import 'package:elminiawy/core/style/images/asset_manger.dart';
import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

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
            context.pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Cancel",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.redError,
                    fontSize: 16.sp)),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: const OrderDetailsBody(),
    );
  }
}

class OrderDetailsBody extends StatefulWidget {
  const OrderDetailsBody({super.key});

  @override
  State<OrderDetailsBody> createState() => _OrderDetailsBodyState();
}

class _OrderDetailsBodyState extends State<OrderDetailsBody> {
  final int orderStatus = 2;

  List<Step> getSteps(int status) {
    return [
      Step(
          title: Text('Order Placed',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: status >= 0 ? ColorManger.brun : ColorManger.brunLight,
                  fontSize: 12.sp)),
          content: const Align(
              alignment: AlignmentDirectional.topStart, child: SizedBox()),
          isActive: status >= 0,
          state: status > 0 ? StepState.complete : StepState.indexed,
          stepStyle: StepStyle(
            color: ColorManger.brun,
          )),
      Step(
        stepStyle: StepStyle(
          color: ColorManger.brun,
        ),
        title: Text('Preparing',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: status >= 1 ? ColorManger.brun : ColorManger.brunLight,
                fontSize: 12.sp)),
        content: const Align(
            alignment: AlignmentDirectional.topStart, child: SizedBox()),
        isActive: status >= 1,
        state: status > 1 ? StepState.complete : StepState.indexed,
      ),
      Step(
        stepStyle: StepStyle(
          color: ColorManger.brun,
        ),
        title: Text('On its way',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: status >= 2 ? ColorManger.brun : ColorManger.brunLight,
                fontSize: 12.sp)),
        content: const Align(
            alignment: AlignmentDirectional.topStart, child: SizedBox()),
        isActive: status >= 2,
        state: status > 2 ? StepState.complete : StepState.indexed,
      ),
      Step(
        stepStyle: StepStyle(
          color: ColorManger.brun,
        ),
        title: Text('Delivered',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: status >= 3 ? ColorManger.brun : ColorManger.brunLight,
                fontSize: 12.sp)),
        content: const SizedBox(),
        isActive: status >= 3,
        state: status >= 3 ? StepState.complete : StepState.indexed,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          _orderIdContainer(context),
          SizedBox(
            height: 15.h,
          ),
          _orderStautsStepper(context),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }

  Container _orderStautsStepper(BuildContext context) {
    return Container(
      height: orderStatus == 3 ? 340.h : 380.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManger.backgroundItem,
          borderRadius: BorderRadius.circular(12.r)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 25.h, bottom: 10.h),
              child: Text("Order Status",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 18.sp)),
            ),
            Stepper(
              stepIconBuilder: (stepIndex, stepState) =>
                  stepIndex != orderStatus || stepIndex >= 3
                      ? null
                      : Image.asset(ImageAsset.basket),
              connectorColor: WidgetStateProperty.resolveWith(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return ColorManger.brun;
                  }
                  return ColorManger.brownLight;
                },
              ),
              currentStep: orderStatus,
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return const SizedBox.shrink();
              },
              steps: getSteps(orderStatus),
            ),
          ],
        ),
      ),
    );
  }

  Container _orderIdContainer(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
          color: ColorManger.brownLight,
          borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          SizedBox(
            width: 20.w,
          ),
          Image.asset(
            ImageAsset.shoppingBag,
            height: 45.h,
          ),
          SizedBox(
            width: 15.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Order ID",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 14.sp)),
              SizedBox(
                height: 5.h,
              ),
              Text("#hhjjkkkl;nnssnnn",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brunLight,
                      fontSize: 13.sp)),
            ],
          ),
        ],
      ),
    );
  }
}
