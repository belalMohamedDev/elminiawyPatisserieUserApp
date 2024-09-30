import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class PaymentSummary extends StatelessWidget {
  final GetCartDataResponse cartData;

  const PaymentSummary({
    super.key,
    required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    return CouponCard(
      curveAxis: Axis.vertical,
      curvePosition: 200.w,
      clockwise: true,
      borderRadius: 15.r,
      curveRadius: 25.r,
      height: 150.h,
      decoration: BoxDecoration(
        color: ColorManger.brunLight,
      ),
      firstChild: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sub Total',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.backgroundItem,
                      fontSize: 14.sp),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Price After Discount',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.backgroundItem,
                      fontSize: 14.sp),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Tax',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.backgroundItem,
                      fontSize: 14.sp),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Shipping',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.backgroundItem,
                      fontSize: 14.sp),
                ),
              
                SizedBox(height: 10.h),
                Text(
                  'Total Amount',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.backgroundItem,
                      fontSize: 14.sp),
                ),
              ],
            ),
          ),
          const LayoutBuilderPointLine(),
        ],
      ),
      secondChild: Container(
        color: ColorManger.brownLight,
        child: Padding(
          padding: EdgeInsets.only(
              left: 30.w, right: 20.w, top: 15.w), // Adjusted padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'EGP  ${cartData.totalCartPrice}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.backgroundItem,
                    fontSize: 14.sp),
              ),
              SizedBox(height: 5.h),
              Text(
                'EGP  ${cartData.totalPriceAfterDiscount}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.backgroundItem,
                    fontSize: 14.sp),
              ),
              SizedBox(height: 5.h),
              Text(
                'EGP  ${cartData.taxPrice}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.backgroundItem,
                    fontSize: 14.sp),
              ),
              SizedBox(height: 5.h),
              Text(
                'EGP  ${cartData.shippingPrice}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.backgroundItem,
                    fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
            
              Text(
                'EGP  ${cartData.totalOrderPrice}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.backgroundItem,
                    fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
