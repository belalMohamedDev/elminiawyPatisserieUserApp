

import '../../../../../core/common/shared/shared_imports.dart'; // 

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OrderPlacedBody(),
    );
  }
}

class OrderPlacedBody extends StatelessWidget {
  const OrderPlacedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(JsonAsset.congrat),
          SizedBox(
            height: 20.h,
          ),
          Text("Order Placed",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: FontConsistent.fontFamilyAcme,
                  color: ColorManger.brun,
                  fontSize: 24.sp)),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
                "Thank You for Purchasing from Elminiawy You can track Your order no  #${context.read<PaymentCubit>().createOrderResponseData!.sId}",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.brunLight,
                    fontSize: 14.sp)),
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomButton(
              onPressed: () {
                context.pushReplacementNamed(Routes.bottomNavBarRoute);
              },
              radius: 8.r,
              widget: Text('Back to Home',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.white,
                      fontSize: 14.sp))),
          SizedBox(
            height: 15.h,
          ),
          CustomButton(
            color: ColorManger.brunLight,
            onPressed: () {
                  Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const OrderDetails()),
                (route) => false,
              );
            },
            radius: 8.r,
            widget: Text('Track Order',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontConsistent.fontFamilyAcme,
                    color: ColorManger.white,
                    fontSize: 14.sp)),
          ),
        ],
      ),
    );
  }
}
