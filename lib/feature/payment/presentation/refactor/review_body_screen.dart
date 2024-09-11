import 'package:elminiawy/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../address/logic/userAddressCubit/user_address_cubit.dart';
import '../../cubit/payment_cubit.dart';
import '../widget/check_out_processing.dart';

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
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Text(
                    'Edit',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        color: ColorManger.brun,
                        fontSize: 15.sp),
                  ),
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
                InkWell(
                    onTap: () {
                      context.pop();

                      context.pop();
                    },
                    child: Icon(IconlyBold.location, color: ColorManger.brun)),
                SizedBox(
                  width: 2.w,
                ),
                InkWell(
                  onTap: () {
                    context.pop();
                    context.pop();
                  },
                  child: Text(
                    'Change',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontFamily: FontConsistent.fontFamilyAcme,
                        decoration: TextDecoration.underline,
                        color: ColorManger.brunLight,
                        fontSize: 13.sp),
                  ),
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
