



import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file


class SuccessCartScreen extends StatelessWidget {
  const SuccessCartScreen({
    super.key,
    required this.cartData,
  });

  final CartResponse? cartData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
        top: 20.h,
      ),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: ProductCartItem(
                      cartItems: cartData!.data!.cartItems![index]),
                );
              },
              childCount: cartData!.data!.cartItems?.length ?? 0,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 220.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      top: 10.h,
                      bottom: 15.h,
                    ),
                    child: Text(
                      'Save on Your Order',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brown,
                          fontSize: 18.sp),
                    ),
                  ),
                  const ApplyCouponCode(),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      top: 25.h,
                      bottom: 15.h,
                    ),
                    child: Text(
                      'Payment Summary',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brown,
                          fontSize: 18.sp),
                    ),
                  ),
                  PaymentSummary(cartData: cartData!.data!)
                ],
              ),
            ),
          ),
        ], // Other slivrs for remaining widgets
      ),
    );
  }
}
