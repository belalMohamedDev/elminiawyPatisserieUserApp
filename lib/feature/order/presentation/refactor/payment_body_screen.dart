import '../../../../core/common/shared/shared_imports.dart';

class PaymentBody extends StatelessWidget {
  const PaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 30.h, right: 25.w, left: 25.w, bottom: 45.h),
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
          const Spacer(),
          CustomButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: !false)
                  .pushNamed(Routes.shippingReviewScreen);
            },
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

  BlocBuilder _choosePaymentMethod(BuildContext context) {
    final paymentCubit = context.read<PaymentCubit>();
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                paymentCubit.changePaymentMethod('Cash');
              },
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: paymentCubit.choosePaymentMethod == 'Cash'
                      ? ColorManger.brownLight
                      : ColorManger.backgroundItem,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: paymentCubit.choosePaymentMethod == 'Cash'
                        ? ColorManger.brownLight
                        : ColorManger.backgroundItem,
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
                        'Cash on delivery',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: FontConsistent.fontFamilyAcme,
                            color: ColorManger.brun,
                            fontSize: 15.sp),
                      ),
                      const Spacer(),
                      Radio<String>(
                        value: 'Cash',
                        groupValue: paymentCubit.choosePaymentMethod,
                        onChanged: (value) {},
                        activeColor: ColorManger.brun,
                        hoverColor: ColorManger.brun,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            InkWell(
              onTap: () {
                paymentCubit.changePaymentMethod('card');
              },
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: paymentCubit.choosePaymentMethod == 'card'
                      ? ColorManger.brownLight
                      : ColorManger.backgroundItem,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: paymentCubit.choosePaymentMethod == 'card'
                        ? ColorManger.brownLight
                        : ColorManger.backgroundItem,
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
                      Radio<String>(
                        value: 'card',
                        groupValue: paymentCubit.choosePaymentMethod,
                        onChanged: (value) {},
                        activeColor: ColorManger.brun,
                        hoverColor: ColorManger.brun,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
