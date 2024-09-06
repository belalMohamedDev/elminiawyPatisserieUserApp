import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/sharedWidget/custom_button.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../cart/presentation/widget/apply_coupon.dart';
import '../widget/check_out_processing.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CheckOut",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
      ),
      body: const PaymentBody(),
    );
  }
}

class PaymentBody extends StatelessWidget {
  const PaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, right: 25.w, left: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CheckOutProcessing(screenIndex: 2),
          SizedBox(
            height: 50.h,
          ),
          Text(
            'Choose Your Payment Method',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 15.sp),
          ),
          SizedBox(
            height: 14.h,
          ),
          _choosePaymentMethod(context),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Promo Code',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 15.sp),
          ),
          SizedBox(
            height: 14.h,
          ),
          const ApplyCouponCode(),
          SizedBox(
            height: 45.h,
          ),
          CustomButton(
            onPressed: () {},
            radius: 8.r,
            widget: Text(
              'Save and Continue',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.white,
                  fontSize: 13.sp),
            ),
          )
        ],
      ),
    );
  }

  Column _choosePaymentMethod(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            color: ColorManger.brownLight,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: ColorManger.brownLight,
              width: 0.5.w,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              children: [
                Icon(
                  Icons.handshake_rounded,
                  color: ColorManger.brun,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  'Cash on delivey',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 15.sp),
                ),
                const Spacer(),
                Radio(
                  value: 'Cash on delivey',
                  groupValue: const [],
                  onChanged: (value) {},
                  activeColor: ColorManger.brun,
                  hoverColor: ColorManger.brun,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
        Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            color: ColorManger.backgroundItem,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: ColorManger.brownLight,
              width: 0.5.w,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              children: [
                Icon(
                  Icons.credit_card,
                  color: ColorManger.brun,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  'Credit or debit Card',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 15.sp),
                ),
                const Spacer(),
                Radio(
                  value: 'Credit or debit Card',
                  groupValue: const [],
                  onChanged: (value) {},
                  activeColor: ColorManger.brun,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
