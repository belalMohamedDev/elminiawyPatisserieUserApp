import 'package:elminiawy/feature/cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/sharedWidget/custom_button.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../address/logic/userAddressCubit/user_address_cubit.dart';
import '../../cubit/payment_cubit.dart';
import '../widget/check_out_processing.dart';

class ReviewPaymentScreen extends StatelessWidget {
  const ReviewPaymentScreen({super.key});

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
      body: const ReviewPaymentBody(),
      bottomNavigationBar: _orderSummary(context),
    );
  }

  Container _orderSummary(BuildContext context) {
    final cartData = context.read<CartCubit>().cartData;

    return Container(
      height: 280.h,
      color: ColorManger.backgroundItem,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.brun,
                  fontSize: 15.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  'Cart Total',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 15.sp),
                ),
                const Spacer(),
                Text(
                  '${cartData!.data!.totalCartPrice!} EGP',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brunLight,
                      fontSize: 15.sp),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  'Delivery Fee',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 15.sp),
                ),
                const Spacer(),
                Text(
                  '${cartData.data!.taxPrice!} EGP',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brunLight,
                      fontSize: 15.sp),
                ),
              ],
            ),
            Divider(
              color: ColorManger.brownLight,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 15.sp),
                ),
                const Spacer(),
                Text(
                  '${cartData.data!.totalOrderPrice!} EGP',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 15.sp),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              onPressed: () {},
              radius: 8.r,
              widget: Text(
                'Sunmit Order',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.white,
                    fontSize: 13.sp),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.car_rental_outlined,
                  color: ColorManger.brun,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Order Will be delivered in 90 min - 120 min',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 12.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewPaymentBody extends StatelessWidget {
  const ReviewPaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, right: 25.w, left: 25.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CheckOutProcessing(screenIndex: 3),
            SizedBox(
              height: 25.h,
            ),
            _shippingAddresssContainer(context),
            SizedBox(
              height: 10.h,
            ),
            _paymentMethodContainer(context),
            SizedBox(
              height: 15.h,
            ),
            _addNotes(context)
          ],
        ),
      ),
    );
  }

  Column _addNotes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Notes',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: FontConsistent.fontFamilyAcme,
              color: ColorManger.brun,
              fontSize: 15.sp),
        ),
        SizedBox(
          height: 5.h,
        ),
        TextFormField(
          // controller: context.read<CartCubit>().applyCouponController,
          keyboardType: TextInputType.text,
          minLines: 3,
          maxLines: 10,
          decoration: InputDecoration(
              hintText: 'Type any note related to this order',
              hintStyle: TextStyle(color: ColorManger.brunLight),
              fillColor: ColorManger.backgroundItem,
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorManger.brownLight, width: 0.5),
                borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManger.backgroundItem,
                ),
                borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
              )),
        ),
      ],
    );
  }

  Container _paymentMethodContainer(BuildContext context) {
    final paymentCubit = context.read<PaymentCubit>();

    return Container(
      height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ColorManger.brownLight,
          width: 0.5.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 15.h, left: 10.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Payment',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 16.sp),
                ),
                const Spacer(),
                Text(
                  'Edit',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 15.sp),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Icon(Icons.credit_card, color: ColorManger.brun),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  paymentCubit.choosePaymentMethod,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brunLight,
                      fontSize: 13.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _shippingAddresssContainer(BuildContext context) {
    final addressData = context
        .read<UserAddressCubit>()
        .addressDataList[context.read<PaymentCubit>().selectedIndex];

    return Container(
      height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManger.backgroundItem,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ColorManger.brownLight,
          width: 0.5.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 15.h, left: 10.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Shipping Address',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brun,
                      fontSize: 16.sp),
                ),
                const Spacer(),
                Icon(IconlyBold.location, color: ColorManger.brun),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  'Change',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      decoration: TextDecoration.underline,
                      color: ColorManger.brunLight,
                      fontSize: 13.sp),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Icon(IconlyBold.location, color: ColorManger.brun),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  addressData.buildingName!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.brunLight,
                      fontSize: 13.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
